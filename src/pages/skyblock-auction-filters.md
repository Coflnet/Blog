---
title: "Optimizing Auction filters"
description: 'The filter system is what allows our users to quickly find what they are looking for.'
date: 2022-02-20
---

Each filter collection is made up of `name` `value` pairs representing different filters (or just one).
The simplicitly and extensibility of this it what makes it so great to work with.
Any new filter can be reduced to a name like `DragonArmorSkinFilter` and a value like [`YOUNG_BABY`](https://sky.coflnet.com/item/YOUNG_BABY)

Internally a filter also has a `type` and `options`.
The type specifies what kind of input the user is expected to make. A number filter for example should block everything that is not a number.
Options specify either the possible select options or the upper and lower bound of a number input.

Each filter takes in an auction and outputs wherever or not it matches that auction given its filter`value`.
The first filter system version used to do this with the Where extention method on `IQueryable`.
An `IQueryable` is esentially an abstraction for any datasource such as a Database but can also be created from an array.
The possibility to create it from an array was used to check if a single auction was matched by a filter.
```c#
FilterEngine.AddFilters(new SaveAuction[] { auction }.AsQueryable(), Filters).Any();
```
With the abstraction of `IQueryable` the code was relatively straight forward and easy to understand.
However, as I later noticed, the abstraction caused a slowdown which was only noticeable once other parts of the flipper got faster.  
(Also the fact that some users made hughe filter lists of 300+ items instead of the anticipated 10 didn't help)

## Time to optimize 
After recognizing the problem I first tried to optimize the IQueryable which proofed to pretty complicated 
as [this Blog Post](https://blog.ploeh.dk/2012/03/26/IQueryableTisTightCoupling/) seems to have already figured out 10 years ago.

Then I found that the `.Where` extention method from `Linq` isn't the same for `IQueryable` and `IEnumerable`.
And in fact queries against an `IEnumerable` are much faster than the original ones.  
So just switch everything to `IEnumerable` right?  
Well not so fast. You could do that but would loose the benefit of an `IQueryable` which is that the query is executed in the Database and not in the code.
Ie. Every item history search on [sky.coflnet.com](https://sky.coflnet.com) would load all auctions (currently about 350 million) and only then filter them.
As you might can tell this isn't feasible and would not return any results before the HTTP timeout.  
Instead I implemented both versions one Method taking and returning `IEnumerable` and one taking and returning `IQueryable`.

But now I had dupplicated a lot of code. 
I absolutely hate dupplicate code as it is guranteed that one version will differ from the other at some point.

There had to be a way to `express` the filter in a way that both `.Where` extentions understand.  
And in fact there is. After analysing the parameters of the `.Where` methods I found they both accept `Expression`s.
An `Expression` in most cases is a so called `Lamda` which is a fancy term for a Method without a name.
An example! Here is the content of the `Bin` filter (simplified a bit)
```c#
public override Expression<Func<Auction, bool>> GetExpression(FilterArgs args)
{
    if (args.Get(this) == "true")
        return auction => auction.Bin;
    return auction => !auction.Bin;
}
``` 
`GetExpression` returns an `Expression` which is of type `Func` of `Auction` to `bool`.
Essentially a Method returning `true` or `false` given some `Auction`. 
Because this is an `Expression` it can be analysed by the Database as well as used in code to match new flips very quickly. It also enables the filter `value` to be parsed only once and then reused as it is part of the `Expression` itself.
The fact that this isn't a loop or some nested structure AND can reuse parsed filter `values` makes it even faster.

## Summary
Using Expressions is the best way I found to match filters. If you have an even better way feel free to hit me up. Or even better submit a PullRequest :)
In case you are not overloaded by now, take a look at my [first implementation](https://github.com/Coflnet/SkyFilter/commit/02e1107be271831a1f189e30c989d19c71222733)  
Or do some further reading about [Expression trees](https://tyrrrz.me/blog/expression-trees)

