--[[ Moses.lua 1.3.0 - A utility-belt library for functional programming in Lua - Copyright (c) 2012 Roland_Yonaba, MIT Licensed <http://www.opensource.org/licenses/mit-license.php>]]
local caa,daa,_ba,aba=next,type,unpack,select;local bba,cba=setmetatable,getmetatable
local dba,_ca=table.insert,table.sort;local aca,bca=table.remove,table.concat
local cca,dca,_da=math.randomseed,math.random,math.huge;local ada,bda,cda=math.floor,math.max,math.min;local dda=getfenv;local __b=_ba
local a_b,b_b=pairs,ipairs;local c_b={}local function d_b(_cb,acb)return _cb>acb end
local function _ab(_cb,acb)return _cb<acb end;local function aab(_cb,acb,bcb)
return(_cb<acb)and acb or(_cb>bcb and bcb or _cb)end
local function bab(_cb,acb)return acb and true end;local function cab(_cb)return not _cb end;local function dab(_cb)local acb
for bcb,ccb in a_b(_cb)do acb=(acb or 0)+1 end;return acb end
local function _bb(_cb,acb,bcb,...)local ccb
local dcb=bcb or c_b.identity;for _db,adb in a_b(_cb)do
if not ccb then ccb=dcb(adb,...)else local bdb=dcb(adb,...)ccb=
acb(ccb,bdb)and ccb or bdb end end;return ccb end;local abb=-1
function c_b.each(_cb,acb,...)if not c_b.isObject(_cb)then return end;for bcb,ccb in a_b(_cb)do
acb(bcb,ccb,...)end;return _cb end;c_b.forEach=c_b.each;function c_b.map(_cb,acb,...)local bcb={}
for ccb,dcb in a_b(_cb)do bcb[ccb]=acb(ccb,dcb,...)end;return bcb end
c_b.collect=c_b.map;function c_b.reduce(_cb,acb,bcb)
for ccb,dcb in a_b(_cb)do bcb=not bcb and dcb or acb(bcb,dcb)end;return bcb end
c_b.inject=c_b.reduce;c_b.foldl=c_b.reduce;function c_b.reduceRight(_cb,acb,bcb)return
c_b.reduce(c_b.reverse(_cb),acb,bcb)end
c_b.injectr=c_b.reduceRight;c_b.foldr=c_b.reduceRight
function c_b.mapReduce(_cb,acb,bcb)local ccb={}
for dcb,_db in a_b(_cb)do ccb[dcb]=not bcb and _db or
acb(bcb,_db)bcb=ccb[dcb]end;return ccb end;c_b.mapr=c_b.mapReduce;function c_b.mapReduceRight(_cb,acb,bcb)return
c_b.mapReduce(c_b.reverse(_cb),acb,bcb)end
c_b.maprr=c_b.mapReduceRight
function c_b.include(_cb,acb)
local bcb=c_b.isFunction(acb)and acb or c_b.isEqual;for ccb,dcb in a_b(_cb)do if bcb(dcb,acb)then return true end end;return
false end;c_b.any=c_b.include;c_b.some=c_b.include
function c_b.detect(_cb,acb)local bcb=
c_b.isFunction(acb)and acb or c_b.isEqual;for ccb,dcb in a_b(_cb)do if bcb(dcb,acb)then
return ccb end end end;c_b.find=c_b.detect;c_b.where=c_b.detect
function c_b.select(_cb,acb,...)
local bcb=c_b.map(_cb,acb,...)local ccb={}
for dcb,_db in a_b(bcb)do if _db then ccb[#ccb+1]=_cb[dcb]end end;return ccb end;c_b.filter=c_b.select
function c_b.reject(_cb,acb,...)local bcb=c_b.map(_cb,acb,...)local ccb={}
for dcb,_db in
a_b(bcb)do if not _db then ccb[#ccb+1]=_cb[dcb]end end;return ccb end;c_b.discard=c_b.reject
function c_b.all(_cb,acb,...)return(
(#c_b.select(c_b.map(_cb,acb,...),bab))== (#_cb))end;c_b.every=c_b.all
function c_b.invoke(_cb,acb,...)local bcb={...}
return
c_b.map(_cb,function(ccb,dcb)
if c_b.isObject(dcb)then
if
c_b.has(dcb,acb)then if c_b.isCallable(dcb[acb])then return dcb[acb](dcb,__b(bcb))else return
dcb[acb]end else if c_b.isCallable(acb)then return
acb(dcb,__b(bcb))end end elseif c_b.isCallable(acb)then return acb(dcb,__b(bcb))end end)end
function c_b.pluck(_cb,acb)return
c_b.reject(c_b.map(_cb,function(bcb,ccb)return ccb[acb]end),cab)end;function c_b.max(_cb,acb,...)return _bb(_cb,d_b,acb,...)end;function c_b.min(_cb,acb,...)return
_bb(_cb,_ab,acb,...)end
function c_b.shuffle(_cb,acb)if acb then cca(acb)end
local bcb={}
c_b.each(_cb,function(ccb,dcb)local _db=ada(dca()*ccb)+1;bcb[ccb]=bcb[_db]
bcb[_db]=dcb end)return bcb end
function c_b.same(_cb,acb)
return
c_b.all(_cb,function(bcb,ccb)return c_b.include(acb,ccb)end)and
c_b.all(acb,function(bcb,ccb)return c_b.include(_cb,ccb)end)end;function c_b.sort(_cb,acb)_ca(_cb,acb)return _cb end
function c_b.toArray(...)return{...}end
function c_b.groupBy(_cb,acb,...)local bcb={...}local ccb={}
local dcb=c_b.isFunction(acb)and acb or
(
c_b.isString(acb)and function(_db,adb)return adb[acb](adb,__b(bcb))end)if not dcb then return end
c_b.each(_cb,function(_db,adb)local bdb=dcb(_db,adb)
if ccb[bdb]then ccb[bdb][#ccb[bdb]+
1]=adb else ccb[bdb]={adb}end end)return ccb end
function c_b.countBy(_cb,acb,...)local bcb={...}local ccb={}
c_b.each(_cb,function(dcb,_db)local adb=acb(dcb,_db,__b(bcb))ccb[adb]=(
ccb[adb]or 0)+1 end)return ccb end
function c_b.size(...)local _cb={...}local acb=_cb[1]if c_b.isNil(acb)then return 0 elseif c_b.isObject(acb)then return
dab(_cb[1])else return dab(_cb)end end;function c_b.containsKeys(_cb,acb)
for bcb in a_b(acb)do if not _cb[bcb]then return false end end;return true end
function c_b.sameKeys(_cb,acb)
c_b.each(_cb,function(bcb)if
not acb[bcb]then return false end end)
c_b.each(acb,function(bcb)if not _cb[bcb]then return false end end)return true end
function c_b.reverse(_cb)local acb={}for i=#_cb,1,-1 do acb[#acb+1]=_cb[i]end;return acb end
function c_b.selectWhile(_cb,acb,...)local bcb={}for ccb,dcb in b_b(_cb)do
if acb(ccb,dcb,...)then bcb[ccb]=dcb else break end end;return bcb end;c_b.takeWhile=c_b.selectWhile
function c_b.dropWhile(_cb,acb,...)local bcb;for ccb,dcb in b_b(_cb)do if not acb(ccb,dcb,...)then
bcb=ccb;break end end;if
c_b.isNil(bcb)then return{}end;return c_b.rest(_cb,bcb)end;c_b.rejectWhile=c_b.dropWhile
function c_b.sortedIndex(_cb,acb,bcb,ccb)local dcb=bcb or _ab;if ccb then
c_b.sort(_cb,dcb)end
for i=1,#_cb do if not dcb(_cb[i],acb)then return i end end;return#_cb+1 end
function c_b.indexOf(_cb,acb)for k=1,#_cb do if _cb[k]==acb then return k end end end
function c_b.lastIndexOf(_cb,acb)local bcb=c_b.indexOf(c_b.reverse(_cb),acb)if bcb then return
#_cb-bcb+1 end end;function c_b.add(_cb,...)
c_b.each({...},function(acb,bcb)dba(_cb,1,bcb)end)return _cb end;function c_b.push(_cb,...)c_b.each({...},function(acb,bcb)
_cb[#_cb+1]=bcb end)
return _cb end;function c_b.pop(_cb)local acb=_cb[1]
aca(_cb,1)return acb end;c_b.shift=c_b.pop;function c_b.unshift(_cb)
local acb=_cb[#_cb]aca(_cb)return acb end
function c_b.removeRange(_cb,acb,bcb)
local ccb=c_b.clone(_cb)local dcb,_db=(caa(ccb)),#ccb;if _db<1 then return ccb end
acb=aab(acb or dcb,dcb,_db)bcb=aab(bcb or _db,dcb,_db)if bcb<acb then return ccb end
local adb=bcb-acb+1;local bdb=acb;while adb>0 do aca(ccb,bdb)adb=adb-1 end;return ccb end;c_b.rmRange=c_b.removeRange
function c_b.slice(_cb,acb,bcb)return
c_b.select(_cb,function(ccb)return(ccb>= (acb or caa(_cb))and ccb<= (
bcb or#_cb))end)end;function c_b.first(_cb,acb)local bcb=acb or 1
return c_b.slice(_cb,1,cda(bcb,#_cb))end;c_b.head=c_b.first
c_b.take=c_b.first;function c_b.initial(_cb,acb)if acb and acb<0 then return end
return c_b.slice(_cb,1,acb and
#_cb- (cda(acb,#_cb))or#_cb-1)end;function c_b.last(_cb,acb)if
acb and acb<=0 then return end
return c_b.slice(_cb,
acb and#_cb-cda(acb-1,#_cb-1)or 2,#_cb)end;function c_b.rest(_cb,acb)if acb and
acb>#_cb then return{}end
return c_b.slice(_cb,
acb and bda(1,cda(acb,#_cb))or 1,#_cb)end
c_b.tail=c_b.rest;function c_b.compact(_cb)
return c_b.reject(_cb,function(acb,bcb)return not bcb end)end
function c_b.flatten(_cb,acb)local bcb=acb or false
local ccb;local dcb={}
for _db,adb in a_b(_cb)do
if c_b.isObject(adb)and not bcb then
ccb=c_b.flatten(adb)
c_b.each(ccb,function(bdb,cdb)dcb[#dcb+1]=cdb end)else dcb[#dcb+1]=adb end end;return dcb end;function c_b.difference(_cb,...)local acb=c_b.toArray(...)
return c_b.select(_cb,function(bcb,ccb)return
not c_b.include(acb,ccb)end)end
c_b.without=c_b.difference
function c_b.uniq(_cb,acb,bcb,...)
local ccb=bcb and c_b.map(_cb,bcb,...)or _cb;local dcb={}
if not acb then for _db,adb in b_b(ccb)do
if not c_b.include(dcb,adb)then dcb[#dcb+1]=adb end end;return dcb end;dcb[#dcb+1]=ccb[1]for i=2,#ccb do if ccb[i]~=dcb[#dcb]then
dcb[#dcb+1]=ccb[i]end end;return dcb end;c_b.unique=c_b.uniq;function c_b.union(...)
return c_b.uniq(c_b.flatten({...}))end
function c_b.intersection(_cb,...)local acb={...}local bcb={}
for ccb,dcb in b_b(_cb)do if c_b.all(acb,function(_db,adb)return
c_b.include(adb,dcb)end)then
dba(bcb,dcb)end end;return bcb end
function c_b.zip(...)local _cb={...}
local acb=c_b.max(c_b.map(_cb,function(ccb,dcb)return#dcb end))local bcb={}for i=1,acb do bcb[i]=c_b.pluck(_cb,i)end;return bcb end
function c_b.append(_cb,acb)local bcb={}for ccb,dcb in b_b(_cb)do bcb[ccb]=dcb end;for ccb,dcb in b_b(acb)do
bcb[#bcb+1]=dcb end;return bcb end
function c_b.range(...)local _cb={...}local acb,bcb,ccb
if#_cb==0 then return{}elseif#_cb==1 then bcb,acb,ccb=_cb[1],0,1 elseif#_cb==2 then
acb,bcb,ccb=_cb[1],_cb[2],1 elseif#_cb==3 then acb,bcb,ccb=_cb[1],_cb[2],_cb[3]end;if(ccb and ccb==0)then return{}end;local dcb={}
local _db=bda(ada((bcb-acb)/ccb),0)for i=1,_db do dcb[#dcb+1]=acb+ccb*i end;if#dcb>0 then
dba(dcb,1,acb)end;return dcb end;c_b.count=c_b.range;function c_b.invert(_cb)local acb={}
c_b.each(_cb,function(bcb,ccb)acb[ccb]=bcb end)return acb end
c_b.mirror=c_b.invert
function c_b.concat(_cb,acb,bcb,ccb)
local dcb=c_b.map(_cb,function(_db,adb)return tostring(adb)end)return bca(dcb,acb,bcb,ccb)end;c_b.join=c_b.concat;function c_b.identity(_cb)return _cb end
function c_b.once(_cb)local acb=0;local bcb={}return
function(...)acb=
acb+1;if acb<=1 then bcb={...}end;return _cb(__b(bcb))end end
function c_b.memoize(_cb,acb)local bcb=bba({},{__mode='kv'})
local ccb=acb or c_b.identity
return function(...)local dcb=ccb(...)local _db=bcb[dcb]
if not _db then bcb[dcb]=_cb(...)end;return bcb[dcb]end end;c_b.cache=c_b.memoize
function c_b.after(_cb,acb)local bcb,ccb=acb,0;return function(...)ccb=ccb+1
if ccb>=bcb then return _cb(...)end end end
function c_b.compose(...)local _cb=c_b.reverse{...}return
function(...)local acb;for bcb,ccb in a_b(_cb)do acb=acb and ccb(acb)or
ccb(...)end;return acb end end
function c_b.wrap(_cb,acb)return function(...)return acb(_cb,...)end end
function c_b.times(_cb,acb,...)local bcb={}for i=1,_cb do bcb[i]=acb(i,...)end;return bcb end
function c_b.bind(_cb,acb)return function(...)return _cb(acb,...)end end
function c_b.bindn(_cb,...)local acb={...}return function(...)
return _cb(__b(c_b.append(acb,{...})))end end
function c_b.uniqueId(_cb,...)abb=abb+1
if _cb then if c_b.isString(_cb)then return _cb:format(abb)elseif
c_b.isFunction(_cb)then return _cb(abb,...)end end;return abb end;c_b.uId=c_b.uniqueId;function c_b.keys(_cb)local acb={}
c_b.each(_cb,function(bcb,ccb)acb[#acb+1]=bcb end)return acb end;function c_b.values(_cb)local acb={}
c_b.each(_cb,function(bcb,ccb)acb[
#acb+1]=ccb end)return acb end;function c_b.pairs(_cb)local acb={}
c_b.each(_cb,function(bcb,ccb)acb[
#acb+1]={bcb,ccb}end)return acb end
function c_b.extend(_cb,...)
local acb={...}
c_b.each(acb,function(bcb,ccb)if c_b.isObject(ccb)then
c_b.each(ccb,function(dcb,_db)_cb[dcb]=_db end)end end)return _cb end
function c_b.functions(_cb,acb)
if not _cb then return c_b.sort(c_b.keys(c_b))end;local bcb=acb or{}
c_b.each(_cb,function(dcb,_db)
if c_b.isFunction(_db)then bcb[#bcb+1]=dcb end end)local ccb=cba(_cb)if ccb and ccb.__index then
c_b.functions(ccb.__index,bcb)end;return c_b.sort(bcb)end;c_b.methods=c_b.functions
function c_b.clone(_cb,acb)
if not c_b.isObject(_cb)then return _cb end;local bcb={}
c_b.each(_cb,function(ccb,dcb)
if c_b.isObject(dcb)then if not acb then bcb[ccb]=c_b.clone(dcb,acb)else
bcb[ccb]=dcb end else bcb[ccb]=dcb end end)return bcb end;function c_b.has(_cb,acb)return _cb[acb]~=nil end
function c_b.pick(_cb,...)
local acb=c_b.flatten{...}local bcb={}
c_b.each(acb,function(ccb,dcb)if _cb[dcb]then bcb[dcb]=_cb[dcb]end end)return bcb end;c_b.choose=c_b.pick
function c_b.omit(_cb,...)local acb=c_b.flatten{...}local bcb={}
c_b.each(_cb,function(ccb,dcb)if not
c_b.include(acb,ccb)then bcb[ccb]=dcb end end)return bcb end;c_b.drop=c_b.omit;function c_b.template(_cb,acb)
c_b.each(acb,function(bcb,ccb)
if not _cb[bcb]then _cb[bcb]=ccb end end)return _cb end
c_b.defaults=c_b.template
function c_b.isEqual(_cb,acb,bcb)local ccb=daa(_cb)local dcb=daa(acb)if ccb~=dcb then return false end;if ccb~=
'table'then return(_cb==acb)end;local _db=cba(_cb)local adb=cba(acb)if
bcb then
if _db or adb and _db.__eq or adb.__eq then return(_cb==acb)end end;if
c_b.size(_cb)~=c_b.size(acb)then return false end;for bdb,cdb in a_b(_cb)do local ddb=acb[bdb]
if c_b.isNil(ddb)or not
c_b.isEqual(cdb,ddb,bcb)then return false end end
for bdb,cdb in a_b(acb)do
local ddb=_cb[bdb]if c_b.isNil(ddb)then return false end end;return true end
function c_b.result(_cb,acb,...)
if _cb[acb]then if c_b.isCallable(_cb[acb])then return _cb[acb](_cb,...)else return
_cb[acb]end end;if c_b.isCallable(acb)then return acb(_cb,...)end end;function c_b.isObject(_cb)return daa(_cb)=='table'end
function c_b.isCallable(_cb)return
(
c_b.isFunction(_cb)or
(c_b.isObject(_cb)and cba(_cb)and cba(_cb).__call~=nil)or false)end
function c_b.isArray(_cb)if not c_b.isObject(_cb)then return false end;return
c_b.all(c_b.keys(_cb),function(acb,bcb)return
c_b.isNumber(bcb)and(ada(bcb)==bcb)end)end
function c_b.isEmpty(_cb)if c_b.isString(_cb)then return#_cb==0 end;if
c_b.isObject(_cb)then return caa(_cb)==nil end;return true end;function c_b.isString(_cb)return daa(_cb)=='string'end;function c_b.isFunction(_cb)return
daa(_cb)=='function'end;function c_b.isNil(_cb)
return _cb==nil end
function c_b.isFinite(_cb)
if not c_b.isNumber(_cb)then return false end;return _cb>-_da and _cb<_da end;function c_b.isNumber(_cb)return daa(_cb)=='number'end;function c_b.isNaN(_cb)return
c_b.isNumber(_cb)and _cb~=_cb end;function c_b.isBoolean(_cb)return
daa(_cb)=='boolean'end;local function bbb()
local _cb=c_b.functions()local acb=dda()
c_b.each(_cb,function(bcb,ccb)acb[ccb]=c_b[ccb]end)end;local cbb=bbb
local dbb={import=bbb,mixin=cbb}dbb.__index=dbb;return bba(c_b,dbb)