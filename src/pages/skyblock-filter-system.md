---
title: "New Filter system"
description: 'The new filter system is online'
date: 2021-06-22
---

# The filter Update
Filters allow you to find a reference price for some item you have, or are being offered.

## What changed
You could filter auctions by enchantments and reforges before.
It worked great, at first, but got slower over time as the filter tried to get through more and more auctions.
Furthermore all items displayed the filter option, not just those which can be enchanted/reforged.
The new filter is more optimized and (mostly) only display on the items it actually makes sense.
Still if you filter for longer time periods the answer will take longer.
It could take multiple miniutes to search through the whole history of enchanted books. 
To prevent you from waiting for long periods of time filtering on `All Time` got disabled.
We are held back by increasing server costs to store these over 210 million auctions.
So please consider purchasing a [premium plan](https://sky.coflnet.com/premium) to help us.
Its also much easier for us to add new filters for other item attributes such as the `uId`.
We will add more filters soon.

### How do I add a filter
1. You click on `(+) Add Filter`.
2. You select a filter from the dropdown.
3. You modify the filter value
4. You hit `Apply`
5. You look at the new graph 
6. You click on a recent auction and verify that the filter was correct

This, as the rest of the site, is still work in progress. 
If you find an incorrect filter result please copy the `URL` and [send it to us](https://sky.coflnet.com/feedback)

### What filters do exist
In theory every attribute of an item can be filtered for.
Currently existing filters are:
* Enchantment (type and level)
* Reforge
* UId
* Pet Level
* Rarity (COMMON-SUPREME)
* End After
* End Before 

Not all filters are available for all items. 

## Filter by uId
One of the first filters we added is the `UId` filter.
The `uId` (short for unique identifier) is a special attribute of most non stackable items that is, well, unique.
Its part of the so called `NBT data`. 

### What is it useful for?
The `uId` useful for tracing an item back/forward from seller to (re-)seller. 
It can revel who applied what onto an item.
Or if you got scammed find where your stuff ended up. 
### Cool, How do I find it?
You currently have to:
1. Go to an auction you want to get the `uId` for
2. Open `Item-Details`
3. Next to `NBT-Data:` Click `Click to show` 

If the item has an `uId` you will find it there. But not all auctions have one.

### Technical stuff
It is derived from the `uuId` (universal unique identifier) and represents the last 12 characters of it.
A normal `uuId` has 32 chars but since we store so many items we decided to save on storage cost.
Twelfe characters are enough to clearly identify an item. 

## The Hypixel Network back up again
Hypixel is in the process of opening back up again. 
All our [premium plan](https://sky.coflnet.com/premium) users got an extra 5 days added to their initial plan.