local slo60nGX='1.6.1'local XKD,SWFtRywD,e,v=next,type,select,pcall
local l6Sm5,oUA=setmetatable,getmetatable;local QFKEzBf,odpE=table.insert,table.sort;local p,lIpFkbLI=table.remove,table.concat
local JdUtcU,GQLN,toXyq=math.randomseed,math.random,math.huge;local S9TO,pS78Y,BCf7=math.floor,math.max,math.min;local RlMSrmdD=rawget
local VCD=table.unpack or unpack;local OV7,X83a=pairs,ipairs;local PizLA9mj=os.clock;local hUL={}local function l(VQT,Id)return VQT>Id end;local function kyWtqIf0(Ub,qJExeUn2)return
Ub<qJExeUn2 end
local function zupvsz(cmWo_v,RoXZEsn,BKLwtAVx)return

(cmWo_v<RoXZEsn)and RoXZEsn or(cmWo_v>BKLwtAVx and BKLwtAVx or cmWo_v)end;local function Mw(hUL,BMZNmf0)return BMZNmf0 and true end
local function S1wg_DG(qL9C)return not qL9C end
local function sf0(Colg)local ex2xo17=0;for I,K66 in OV7(Colg)do ex2xo17=ex2xo17+1 end;return ex2xo17 end
local function qxZa6ozV(Tq,jmB,bjO,...)local QoYPziln;local bjO=bjO or hUL.identity
for Hj,KBlIVi in OV7(Tq)do if not QoYPziln then
QoYPziln=bjO(KBlIVi,...)else local KBlIVi=bjO(KBlIVi,...)
QoYPziln=jmB(QoYPziln,KBlIVi)and QoYPziln or KBlIVi end end;return QoYPziln end
local function hgW2H5(OR8it1,GAqAsa,Oc_,Qj)
for Ybp8=0,#OR8it1,GAqAsa do
local ZmzyNm=hUL.slice(OR8it1,Ybp8+1,Ybp8+GAqAsa)
if#ZmzyNm>0 then while(#ZmzyNm<GAqAsa and Qj)do
ZmzyNm[#ZmzyNm+1]=Qj end;Oc_(ZmzyNm)end end end
local function z5i2i(akG0mUnS,iy,gc7SaW,FnbJWd2)
for cpdLk=0,#akG0mUnS,iy-1 do
local FbQX=hUL.slice(akG0mUnS,cpdLk+1,cpdLk+iy)if#FbQX>0 and cpdLk+1 <#akG0mUnS then while
(#FbQX<iy and FnbJWd2)do FbQX[#FbQX+1]=FnbJWd2 end
gc7SaW(FbQX)end end end
local function MGSnnzOI(ejMVLYZd,eS0X,XDQS4ASf)if eS0X==0 then XDQS4ASf(ejMVLYZd)end
for IiNU=1,eS0X do
ejMVLYZd[eS0X],ejMVLYZd[IiNU]=ejMVLYZd[IiNU],ejMVLYZd[eS0X]MGSnnzOI(ejMVLYZd,eS0X-1,XDQS4ASf)
ejMVLYZd[eS0X],ejMVLYZd[IiNU]=ejMVLYZd[IiNU],ejMVLYZd[eS0X]end end;local B0o5xpg7=-1;function hUL.clear(gUfudNUg)for d3 in OV7(gUfudNUg)do gUfudNUg[d3]=nil end;return
gUfudNUg end
function hUL.each(gTOcAHv,vY_4HT1n,...)for DzPbzg,UMD in OV7(gTOcAHv)do
vY_4HT1n(DzPbzg,UMD,...)end end
function hUL.eachi(K3ZE7Ou,fBI,...)
local wMSY=hUL.sort(hUL.select(hUL.keys(K3ZE7Ou),function(_nD2rl,aVh8xSly)return hUL.isInteger(aVh8xSly)end))
for i,P_NNVDyt in X83a(wMSY)do fBI(P_NNVDyt,K3ZE7Ou[P_NNVDyt],...)end end
function hUL.at(cVEyN,...)local uj2AiF={}
for W,lbHN2 in X83a({...})do if hUL.has(cVEyN,lbHN2)then
uj2AiF[#uj2AiF+1]=cVEyN[lbHN2]end end;return uj2AiF end
function hUL.count(PwgW3lfq,z)if hUL.isNil(z)then return hUL.size(PwgW3lfq)end
local sf0=0
hUL.each(PwgW3lfq,function(K,xx)if hUL.isEqual(xx,z)then sf0=sf0+1 end end)return sf0 end
function hUL.countf(aYb,JM2,...)return hUL.count(hUL.map(aYb,JM2,...),true)end
function hUL.cycle(bmAjLT,eExYnwnh)eExYnwnh=eExYnwnh or 1;if eExYnwnh<=0 then return hUL.noop end
local XMBmJyiP,nowqEU6m;local iKD8V=0
while true do
return
function()
XMBmJyiP=XMBmJyiP and XKD(bmAjLT,XMBmJyiP)or XKD(bmAjLT)
nowqEU6m=not nowqEU6m and XMBmJyiP or nowqEU6m
if eExYnwnh then
iKD8V=(XMBmJyiP==nowqEU6m)and iKD8V+1 or iKD8V;if iKD8V>eExYnwnh then return end end;return XMBmJyiP,bmAjLT[XMBmJyiP]end end end
function hUL.map(YtRS,A,...)local mHJ={}
for Q57BJ,vM in OV7(YtRS)do local JeGCDX,AUFZlp,VsrKM=Q57BJ,A(Q57BJ,vM,...)mHJ[VsrKM and AUFZlp or
JeGCDX]=VsrKM or AUFZlp end;return mHJ end
function hUL.reduce(uhIq,EEOUzhy,hbrt)for D,Q in OV7(uhIq)do
if hbrt==nil then hbrt=Q else hbrt=EEOUzhy(hbrt,Q)end end;return hbrt end;function hUL.reduceby(mRqle,sBEZ8,WhHB0ygh,rYSD0,...)
return hUL.reduce(hUL.select(mRqle,rYSD0,...),sBEZ8,WhHB0ygh)end
function hUL.reduceRight(BIL5,GQLlkH,aN4J2zRQ)return
hUL.reduce(hUL.reverse(BIL5),GQLlkH,aN4J2zRQ)end
function hUL.mapReduce(eWca,AGUR2QK,FK)local _={}for YQZ729qQ,rZh2wG in OV7(eWca)do
_[YQZ729qQ]=not FK and rZh2wG or AGUR2QK(FK,rZh2wG)FK=_[YQZ729qQ]end;return _ end;function hUL.mapReduceRight(sef4eW6Q,Z,UacO6D)
return hUL.mapReduce(hUL.reverse(sef4eW6Q),Z,UacO6D)end
function hUL.include(FdnzjW,o)local lMAL=
hUL.isFunction(o)and o or hUL.isEqual;for CpQ,L in OV7(FdnzjW)do if
lMAL(L,o)then return true end end;return false end
function hUL.detect(HnQS_Z,rib)
local w=hUL.isFunction(rib)and rib or hUL.isEqual
for YT6wZ,VYv in OV7(HnQS_Z)do if w(VYv,rib)then return YT6wZ end end end
function hUL.where(gU,JzG8W4Ya)
local dZ54oc=hUL.select(gU,function(v_LoR,gRY)for z in OV7(JzG8W4Ya)do
if gRY[z]~=JzG8W4Ya[z]then return false end end;return true end)return#dZ54oc>0 and dZ54oc or nil end
function hUL.findWhere(ad,Ui0Qa)
local g=hUL.detect(ad,function(Itx)for JpoaGH in OV7(Ui0Qa)do
if Ui0Qa[JpoaGH]~=Itx[JpoaGH]then return false end end;return true end)return g and ad[g]end
function hUL.select(cyAcCT,RCA,...)local L46S={}
for GKTYT,hXSTz8FJ in OV7(cyAcCT)do if RCA(GKTYT,hXSTz8FJ,...)then
L46S[#L46S+1]=hXSTz8FJ end end;return L46S end
function hUL.reject(C24r7o4G,b_4Q38cU,...)local N=hUL.map(C24r7o4G,b_4Q38cU,...)local JbPw={}
for j,S in OV7(N)do if not S then JbPw[
#JbPw+1]=C24r7o4G[j]end end;return JbPw end
function hUL.all(cg4FV7bl,flf9sWX,...)return
(
(#hUL.select(hUL.map(cg4FV7bl,flf9sWX,...),Mw))==sf0(cg4FV7bl))end
function hUL.invoke(uNoS,ZWoH9V08,...)local RWo={...}
return
hUL.map(uNoS,function(GWBQL,PCldTUn9)
if hUL.isTable(PCldTUn9)then
if hUL.has(PCldTUn9,ZWoH9V08)then if
hUL.isCallable(PCldTUn9[ZWoH9V08])then return PCldTUn9[ZWoH9V08](PCldTUn9,VCD(RWo))else return
PCldTUn9[ZWoH9V08]end else
if
hUL.isCallable(ZWoH9V08)then return ZWoH9V08(PCldTUn9,VCD(RWo))end end elseif hUL.isCallable(ZWoH9V08)then return ZWoH9V08(PCldTUn9,VCD(RWo))end end)end
function hUL.pluck(sO_,ALbdmINL)return
hUL.reject(hUL.map(sO_,function(b,DUgF0E)return DUgF0E[ALbdmINL]end),S1wg_DG)end
function hUL.max(vGxJ6f,a4ga2I,...)return qxZa6ozV(vGxJ6f,l,a4ga2I,...)end
function hUL.min(syGyB_,VO,...)return qxZa6ozV(syGyB_,kyWtqIf0,VO,...)end
function hUL.shuffle(J1r,iBcU3_7D)if iBcU3_7D then JdUtcU(iBcU3_7D)end;local N={}
hUL.each(J1r,function(M4V,_feve)local OPz_7bk=
S9TO(GQLN()*M4V)+1;N[M4V]=N[OPz_7bk]N[OPz_7bk]=_feve end)return N end
function hUL.same(H64aD,ny7)
return
hUL.all(H64aD,function(QDj6GAX,k6pXzd)return hUL.include(ny7,k6pXzd)end)and
hUL.all(ny7,function(hsLwu,R)return hUL.include(H64aD,R)end)end;function hUL.sort(JKZ,yHbsh)odpE(JKZ,yHbsh)return JKZ end
function hUL.sortBy(d4z,i,HyEk4lbh)local PhU=i or
hUL.identity;if hUL.isString(i)then
PhU=function(d4z)return d4z[i]end end;HyEk4lbh=HyEk4lbh or kyWtqIf0
local rWwbNge={}
hUL.each(d4z,function(SKxD,o3uQKvJ)
rWwbNge[#rWwbNge+1]={value=o3uQKvJ,transform=PhU(o3uQKvJ)}end)
odpE(rWwbNge,function(vAZm,q)return HyEk4lbh(vAZm.transform,q.transform)end)return hUL.pluck(rWwbNge,'value')end
function hUL.groupBy(fFuE,KypMW,...)local JJT4nKO={...}local TFLF={}
hUL.each(fFuE,function(hEoAa,PGN)
local K2_kF5=KypMW(hEoAa,PGN,VCD(JJT4nKO))if TFLF[K2_kF5]then
TFLF[K2_kF5][#TFLF[K2_kF5]+1]=PGN else TFLF[K2_kF5]={PGN}end end)return TFLF end
function hUL.countBy(YpimJ,Gg7Ttui,...)local _={...}local EGeAf={}
hUL.each(YpimJ,function(ymP,z5pHKyoa)
local h=Gg7Ttui(ymP,z5pHKyoa,VCD(_))EGeAf[h]=(EGeAf[h]or 0)+1 end)return EGeAf end
function hUL.size(...)local xwT={...}local y33ux=xwT[1]if hUL.isTable(y33ux)then return sf0(xwT[1])else return
sf0(xwT)end end;function hUL.containsKeys(Ut,GOijBp)
for oUi in OV7(GOijBp)do if not Ut[oUi]then return false end end;return true end
function hUL.sameKeys(b2a3,xer)
for SQHAAR in
OV7(b2a3)do if not xer[SQHAAR]then return false end end
for qybRcP1 in OV7(xer)do if not b2a3[qybRcP1]then return false end end;return true end
function hUL.sample(z,N0NaR,FBfW)N0NaR=N0NaR or 1;if N0NaR<1 then return end;if N0NaR==1 then
if FBfW then JdUtcU(FBfW)end;return z[GQLN(1,#z)]end;return
hUL.slice(hUL.shuffle(z,FBfW),1,N0NaR)end
function hUL.sampleProb(lnM4,_oDmX_,t)if t then JdUtcU(t)end;return
hUL.select(lnM4,function(hUL,K)return GQLN()<_oDmX_ end)end;function hUL.toArray(...)return{...}end
function hUL.find(ppm021I,ASUXhD,KCm)for u=KCm or 1,#ppm021I do if
hUL.isEqual(ppm021I[u],ASUXhD)then return u end end end;function hUL.reverse(fDk)local gxYY={}
for sVMxk=#fDk,1,-1 do gxYY[#gxYY+1]=fDk[sVMxk]end;return gxYY end
function hUL.fill(SyD,v4,j7siW,Hl)Hl=Hl or
hUL.size(SyD)for j7siW=j7siW or 1,Hl do SyD[j7siW]=v4 end;return SyD end
function hUL.selectWhile(AP060rq,DIEKD10,...)local lLJ={}for EicsS,JubU in X83a(AP060rq)do
if DIEKD10(EicsS,JubU,...)then lLJ[EicsS]=JubU else break end end;return lLJ end
function hUL.dropWhile(L,JKci,...)local SsBe;for o,ZOmcmO in X83a(L)do
if not JKci(o,ZOmcmO,...)then SsBe=o;break end end
if hUL.isNil(SsBe)then return{}end;return hUL.rest(L,SsBe)end
function hUL.sortedIndex(_G19JrRB,m0r3_J,MLrs,hP5)local oqjhEZb0=MLrs or kyWtqIf0;if hP5 then
hUL.sort(_G19JrRB,oqjhEZb0)end
for Pha=1,#_G19JrRB do if
not oqjhEZb0(_G19JrRB[Pha],m0r3_J)then return Pha end end;return#_G19JrRB+1 end;function hUL.indexOf(G,MOrzq4)
for bEMp=1,#G do if G[bEMp]==MOrzq4 then return bEMp end end end
function hUL.lastIndexOf(dd,MOQN)
local O=hUL.indexOf(hUL.reverse(dd),MOQN)if O then return#dd-O+1 end end;function hUL.findIndex(FEpet,P,...)
for G=1,#FEpet do if P(G,FEpet[G],...)then return G end end end
function hUL.findLastIndex(EcLLM,wo,...)
local ur=hUL.findIndex(hUL.reverse(EcLLM),wo,...)if ur then return#EcLLM-ur+1 end end;function hUL.addTop(XTX,...)
hUL.each({...},function(wc8hjKp1,f)QFKEzBf(XTX,1,f)end)return XTX end;function hUL.push(Hjag,...)
hUL.each({...},function(Yg,uc)Hjag[
#Hjag+1]=uc end)return Hjag end
function hUL.pop(bw,ad)
ad=BCf7(ad or 1,#bw)local EG344W={}
for MVlUhPEM=1,ad do local LT=bw[1]EG344W[#EG344W+1]=LT;p(bw,1)end;return VCD(EG344W)end
function hUL.unshift(pfiWYrg,smnX9H6)smnX9H6=BCf7(smnX9H6 or 1,#pfiWYrg)local FzRhHR={}for mMBxOoQa=1,smnX9H6 do local xYSLIT=pfiWYrg[
#pfiWYrg]FzRhHR[#FzRhHR+1]=xYSLIT
p(pfiWYrg)end;return VCD(FzRhHR)end
function hUL.pull(Eae7ILmk,...)for Jy23ZRAA,V8IWw in X83a({...})do
for uyYdf=#Eae7ILmk,1,-1 do if hUL.isEqual(Eae7ILmk[uyYdf],V8IWw)then
p(Eae7ILmk,uyYdf)end end end
return Eae7ILmk end
function hUL.removeRange(K,ZX,tbdC)local K=hUL.clone(K)local VaY3,HK7Mbgze=(XKD(K)),#K
if HK7Mbgze<1 then return K end;ZX=zupvsz(ZX or VaY3,VaY3,HK7Mbgze)
tbdC=zupvsz(tbdC or HK7Mbgze,VaY3,HK7Mbgze)if tbdC<ZX then return K end;local sf0=tbdC-ZX+1;local VaY3=ZX;while sf0 >0 do p(K,VaY3)
sf0=sf0-1 end;return K end
function hUL.chunk(VXPfx,j3Qk,...)if not hUL.isArray(VXPfx)then return VXPfx end
local X1,GpruB,r={},0;local V7YqV=hUL.map(VXPfx,j3Qk,...)
hUL.each(V7YqV,function(JbvH7,Cqk9Luq)
r=(r==nil)and Cqk9Luq or r
GpruB=((Cqk9Luq~=r)and(GpruB+1)or GpruB)if not X1[GpruB]then X1[GpruB]={VXPfx[JbvH7]}else
X1[GpruB][#X1[GpruB]+1]=VXPfx[JbvH7]end;r=Cqk9Luq end)return X1 end
function hUL.slice(PeAP9X,vN5AF9,j)return
hUL.select(PeAP9X,function(EOgmP)return
(EOgmP>= (vN5AF9 or XKD(PeAP9X))and EOgmP<= (j or
#PeAP9X))end)end
function hUL.first(j,mJof)local mJof=mJof or 1;return hUL.slice(j,1,BCf7(mJof,#j))end
function hUL.initial(yz1Kuwby,KVE6TG)if KVE6TG and KVE6TG<0 then return end;return
hUL.slice(yz1Kuwby,1,KVE6TG and#yz1Kuwby- (BCf7(KVE6TG,
#yz1Kuwby))or#
yz1Kuwby-1)end;function hUL.last(YY,r9)if r9 and r9 <=0 then return end
return hUL.slice(YY,r9 and
#YY-BCf7(r9-1,#YY-1)or 2,#YY)end;function hUL.rest(mtUG,PFRuf)if PFRuf and
PFRuf>#mtUG then return{}end
return hUL.slice(mtUG,PFRuf and
pS78Y(1,BCf7(PFRuf,#mtUG))or 1,#mtUG)end;function hUL.nth(KhK1gRj9,Xgj)return
KhK1gRj9[Xgj]end;function hUL.compact(Ko)return
hUL.reject(Ko,function(hUL,A)return not A end)end
function hUL.flatten(IU6Om,sKIIqz)local sKIIqz=
sKIIqz or false;local wmhARqEa;local _RT3={}
for V,BTA in OV7(IU6Om)do
if hUL.isTable(BTA)then wmhARqEa=
sKIIqz and BTA or hUL.flatten(BTA)
hUL.each(wmhARqEa,function(hUL,QVEYENaX)
_RT3[#_RT3+1]=QVEYENaX end)else _RT3[#_RT3+1]=BTA end end;return _RT3 end
function hUL.difference(gxqa,q4)if not q4 then return hUL.clone(gxqa)end;return
hUL.select(gxqa,function(QyKi,_o3FE)return not
hUL.include(q4,_o3FE)end)end
function hUL.union(...)return hUL.uniq(hUL.flatten({...}))end
function hUL.intersection(n,...)local WM={...}local zb8b={}
for YBqeh,WRkIg in X83a(n)do if hUL.all(WM,function(YBqeh,RH_vLUg)
return hUL.include(RH_vLUg,WRkIg)end)then
QFKEzBf(zb8b,WRkIg)end end;return zb8b end
function hUL.symmetricDifference(aEH,g20N7)return
hUL.difference(hUL.union(aEH,g20N7),hUL.intersection(aEH,g20N7))end
function hUL.unique(puZN)local _Dy={}for MC=1,#puZN do if not hUL.find(_Dy,puZN[MC])then
_Dy[#_Dy+1]=puZN[MC]end end;return _Dy end;function hUL.isunique(WOBSVeqF)
return hUL.isEqual(WOBSVeqF,hUL.unique(WOBSVeqF))end
function hUL.zip(...)local A={...}
local vqW6=hUL.max(hUL.map(A,function(rBRXA,qfFSJN)
return#qfFSJN end))local R4oRlgh={}
for Va8fT08T=1,vqW6 do R4oRlgh[Va8fT08T]=hUL.pluck(A,Va8fT08T)end;return R4oRlgh end
function hUL.append(d778,aZT)local ni9je9bJ={}
for uwwNE,X40cF in X83a(d778)do ni9je9bJ[uwwNE]=X40cF end
for EW,asgq in X83a(aZT)do ni9je9bJ[#ni9je9bJ+1]=asgq end;return ni9je9bJ end
function hUL.interleave(...)return hUL.flatten(hUL.zip(...))end
function hUL.interpose(IQybL1,hYKT45)return
hUL.flatten(hUL.zip(hYKT45,hUL.rep(IQybL1,#hYKT45-1)))end
function hUL.range(...)local Rq7={...}local LQ_EIcl,uaL,gujcrFp
if#Rq7 ==0 then return{}elseif#Rq7 ==1 then
uaL,LQ_EIcl,gujcrFp=Rq7[1],0,1 elseif#Rq7 ==2 then LQ_EIcl,uaL,gujcrFp=Rq7[1],Rq7[2],1 elseif#Rq7 ==3 then
LQ_EIcl,uaL,gujcrFp=Rq7[1],Rq7[2],Rq7[3]end;if(gujcrFp and gujcrFp==0)then return{}end;local ph06vXj={}
local nH0LB4c=pS78Y(S9TO((
uaL-LQ_EIcl)/gujcrFp),0)for ALwJ9=1,nH0LB4c do
ph06vXj[#ph06vXj+1]=LQ_EIcl+gujcrFp*ALwJ9 end;if#ph06vXj>0 then
QFKEzBf(ph06vXj,1,LQ_EIcl)end;return ph06vXj end
function hUL.rep(_X,ruXMob)local E={}for jcgjAE=1,ruXMob do E[#E+1]=_X end;return E end
function hUL.partition(BZmaGN,HSav,sDjMr)if HSav<=0 then return end
return coroutine.wrap(function()
hgW2H5(BZmaGN,HSav or 1,coroutine.yield,sDjMr)end)end
function hUL.sliding(biQX3Ut,BLEXN_,Ljc)if BLEXN_<=1 then return end
return coroutine.wrap(function()
z5i2i(biQX3Ut,BLEXN_ or 2,coroutine.yield,Ljc)end)end;function hUL.permutation(fpN7T)
return coroutine.wrap(function()
MGSnnzOI(fpN7T,#fpN7T,coroutine.yield)end)end;function hUL.invert(FNSk_)local LmE={}hUL.each(FNSk_,function(pZTFVP,XL)
LmE[XL]=pZTFVP end)
return LmE end
function hUL.concat(L5vC0Jx,vpONJ,A,LN)
local dA14qP=hUL.map(L5vC0Jx,function(A,JcQc)return
tostring(JcQc)end)return lIpFkbLI(dA14qP,vpONJ,A or 1,LN or#L5vC0Jx)end;function hUL.noop()return end;function hUL.identity(hDih6_D)return hDih6_D end
function hUL.constant(QKbZ464i)return function()return
QKbZ464i end end
function hUL.memoize(F1TsZ,uF2)local T=l6Sm5({},{__mode='kv'})
local pC_=uF2 or hUL.identity
return function(...)local ju=pC_(...)local deu1=T[ju]if not deu1 then T[ju]=F1TsZ(...)end;return
T[ju]end end
function hUL.once(IgZ6)local kVRiv3F=0;local kWMf={}
return function(...)kVRiv3F=kVRiv3F+1
if kVRiv3F<=1 then kWMf={...}end;return IgZ6(VCD(kWMf))end end
function hUL.before(DawC,sf0)local cP=0;local w={}return function(...)cP=cP+1;if cP<=sf0 then w={...}end
return DawC(VCD(w))end end
function hUL.after(UZ,sf0)local tdH,ymt=sf0,0;return
function(...)ymt=ymt+1;if ymt>=tdH then return UZ(...)end end end
function hUL.compose(...)local WxGA=hUL.reverse{...}
return
function(...)local jBuHkH,E3=true
for CZi_zK,_6KCMph in X83a(WxGA)do if jBuHkH then jBuHkH=false
E3=_6KCMph(...)else E3=_6KCMph(E3)end end;return E3 end end
function hUL.pipe(PY3VqYZ8,...)return hUL.compose(...)(PY3VqYZ8)end
function hUL.complement(V)return function(...)return not V(...)end end;function hUL.juxtapose(y,...)local QF={}
hUL.each({...},function(hUL,hN)QF[#QF+1]=hN(y)end)return VCD(QF)end
function hUL.wrap(hVflx4kh,GP)return function(...)return
GP(hVflx4kh,...)end end;function hUL.times(oCZYv2dT,RLaqM3,...)local PoH={}
for xM709D=1,oCZYv2dT do PoH[xM709D]=RLaqM3(xM709D,...)end;return PoH end
function hUL.bind(z50,sAPD)return function(...)return
z50(sAPD,...)end end;function hUL.bind2(AVFi,GGKI)
return function(gWaGu,...)return AVFi(gWaGu,GGKI,...)end end;function hUL.bindn(SFKM,...)local j6jQmlbr={...}
return function(...)return
SFKM(VCD(hUL.append(j6jQmlbr,{...})))end end
function hUL.bindAll(m403CY,...)
local dL={...}
for PrTsHeT,eNI3MT7 in X83a(dL)do local Rfoo=m403CY[eNI3MT7]if Rfoo then
m403CY[eNI3MT7]=hUL.bind(Rfoo,m403CY)end end;return m403CY end
function hUL.uniqueId(eUJhGD,...)B0o5xpg7=B0o5xpg7+1;if eUJhGD then
if hUL.isString(eUJhGD)then return
eUJhGD:format(B0o5xpg7)elseif hUL.isFunction(eUJhGD)then return eUJhGD(B0o5xpg7,...)end end
return B0o5xpg7 end;function hUL.iterator(wot8,j9vJ)
return function()j9vJ=wot8(j9vJ)return j9vJ end end
function hUL.array(...)local J6Qr27Mh={}for AwxW8Do in...do
J6Qr27Mh[#J6Qr27Mh+1]=AwxW8Do end;return J6Qr27Mh end;function hUL.flip(_u)return
function(...)return _u(VCD(hUL.reverse({...})))end end
function hUL.over(...)
local B={...}
return function(...)local cdxFVpZw={}
for Y,o9Uh in X83a(B)do cdxFVpZw[#cdxFVpZw+1]=o9Uh(...)end;return cdxFVpZw end end
function hUL.overEvery(...)local BuX1r=hUL.over(...)
return function(...)
return hUL.reduce(BuX1r(...),function(Wyf83f2,P0olj)
return Wyf83f2 and P0olj end)end end;function hUL.overSome(...)local z=hUL.over(...)
return function(...)return
hUL.reduce(z(...),function(EHCCkt,x)return EHCCkt or x end)end end
function hUL.overArgs(xNWVmS,...)
local kGWnkgDu={...}
return
function(...)local Pkis6H28={...}
for tSE=1,#kGWnkgDu do local xNWVmS=kGWnkgDu[tSE]if Pkis6H28[tSE]then
Pkis6H28[tSE]=xNWVmS(Pkis6H28[tSE])end end;return xNWVmS(VCD(Pkis6H28))end end
function hUL.partial(abKH,...)local LDp={...}
return
function(...)local GWouUlzZ={...}local MqJhIr={}
for Q9,c in X83a(LDp)do MqJhIr[Q9]=(c=='_')and
hUL.pop(GWouUlzZ)or c end
return abKH(VCD(hUL.append(MqJhIr,GWouUlzZ)))end end
function hUL.partialRight(qnZ81I,...)local N9uN={...}
return
function(...)local QGC={...}local K8iFU={}for gbU=1,#N9uN do
K8iFU[gbU]=
(N9uN[gbU]=='_')and hUL.pop(QGC)or N9uN[gbU]end;return
qnZ81I(VCD(hUL.append(QGC,K8iFU)))end end
function hUL.curry(h,hS7)hS7=hS7 or 2;local KQjMKhN={}
local function R6PYgHHE(ZwCXrLO)if hS7 ==1 then return h(ZwCXrLO)end;if
ZwCXrLO~=nil then KQjMKhN[#KQjMKhN+1]=ZwCXrLO end;if
#KQjMKhN<hS7 then return R6PYgHHE else local lI={h(VCD(KQjMKhN))}KQjMKhN={}return
VCD(lI)end end;return R6PYgHHE end
function hUL.time(iMSMP5Lp,...)local WoARZdZ3=PizLA9mj()local n={iMSMP5Lp(...)}return
PizLA9mj()-WoARZdZ3,VCD(n)end;function hUL.keys(Uj)local HpN_N={}
hUL.each(Uj,function(yP3QEJ)HpN_N[#HpN_N+1]=yP3QEJ end)return HpN_N end;function hUL.values(pwi)local QP={}
hUL.each(pwi,function(hUL,Iy)QP[
#QP+1]=Iy end)return QP end
function hUL.kvpairs(O9P0mj)local eFGwPxi={}
hUL.each(O9P0mj,function(m4x8ZsD4,_witc0Pe)eFGwPxi[
#eFGwPxi+1]={m4x8ZsD4,_witc0Pe}end)return eFGwPxi end;function hUL.toObj(Y8E)local h={}
for EnMMG,HzO7UpZ in X83a(Y8E)do h[HzO7UpZ[1]]=HzO7UpZ[2]end;return h end;function hUL.property(B)return function(RNTu)
return RNTu[B]end end
function hUL.propertyOf(Q_)return function(S8GB)return
Q_[S8GB]end end;function hUL.toBoolean(W7yjGm)return not not W7yjGm end
function hUL.extend(X,...)
local Y={...}
hUL.each(Y,function(qqvEf3,Wriu)if hUL.isTable(Wriu)then
hUL.each(Wriu,function(I0Pxr5F,ukGf_)X[I0Pxr5F]=ukGf_ end)end end)return X end
function hUL.functions(uZpt01P,hJk0n8bR)uZpt01P=uZpt01P or hUL;local o9DTTJig={}
hUL.each(uZpt01P,function(Uaq2_Xzk,S0DM)
if hUL.isFunction(S0DM)then o9DTTJig[
#o9DTTJig+1]=Uaq2_Xzk end end)if not hJk0n8bR then return hUL.sort(o9DTTJig)end
local v4=oUA(uZpt01P)if v4 and v4.__index then local GHasi5=hUL.functions(v4.__index)
hUL.each(GHasi5,function(QeX_U9tm,Dp9m)o9DTTJig[#
o9DTTJig+1]=Dp9m end)end;return
hUL.sort(o9DTTJig)end
function hUL.clone(sJjNM,GnSs)if not hUL.isTable(sJjNM)then return sJjNM end;local XP={}
hUL.each(sJjNM,function(Sj,yKj1)if
hUL.isTable(yKj1)then
if not GnSs then XP[Sj]=hUL.clone(yKj1,GnSs)else XP[Sj]=yKj1 end else XP[Sj]=yKj1 end end)return XP end;function hUL.tap(F9WZ,A5,...)A5(F9WZ,...)return F9WZ end;function hUL.has(nY_O,QAJAyj5)return nY_O[QAJAyj5]~=
nil end
function hUL.pick(EZ,...)
local n=hUL.flatten{...}local M={}
hUL.each(n,function(AADiL1,Arw)
if not hUL.isNil(EZ[Arw])then M[Arw]=EZ[Arw]end end)return M end
function hUL.omit(b,...)local _ZM1Yj3=hUL.flatten{...}local rmSU={}
hUL.each(b,function(L2RHrI,XW7Y5Rz)if not
hUL.include(_ZM1Yj3,L2RHrI)then rmSU[L2RHrI]=XW7Y5Rz end end)return rmSU end;function hUL.template(C,NhwEkTd)
hUL.each(NhwEkTd or{},function(XGz,Tf4P2eIf)if not C[XGz]then C[XGz]=Tf4P2eIf end end)return C end
function hUL.isEqual(TF3Htu,K5yUw1t,Mi)
local WWyrqnSL=SWFtRywD(TF3Htu)local gVTyP=SWFtRywD(K5yUw1t)if WWyrqnSL~=gVTyP then return false end;if
WWyrqnSL~='table'then return(TF3Htu==K5yUw1t)end
local Ck=oUA(TF3Htu)local CRG=oUA(K5yUw1t)
if Mi then if
(Ck or CRG)and(Ck.__eq or CRG.__eq)then
return Ck.__eq(TF3Htu,K5yUw1t)or CRG.__eq(K5yUw1t,TF3Htu)or(TF3Htu==
K5yUw1t)end end
if hUL.size(TF3Htu)~=hUL.size(K5yUw1t)then return false end;for dkz,zrCq in OV7(TF3Htu)do local azXMvVdM=K5yUw1t[dkz]
if hUL.isNil(azXMvVdM)or not
hUL.isEqual(zrCq,azXMvVdM,Mi)then return false end end
for CBgxHfbq,WO in
OV7(K5yUw1t)do local H=TF3Htu[CBgxHfbq]if hUL.isNil(H)then return false end end;return true end
function hUL.result(C28NuJ3,sz,...)if C28NuJ3[sz]then
if hUL.isCallable(C28NuJ3[sz])then return
C28NuJ3[sz](C28NuJ3,...)else return C28NuJ3[sz]end end;if
hUL.isCallable(sz)then return sz(C28NuJ3,...)end end;function hUL.isTable(qH)return SWFtRywD(qH)=='table'end
function hUL.isCallable(u)return
(
hUL.isFunction(u)or
(hUL.isTable(u)and oUA(u)and oUA(u).__call~=nil)or false)end
function hUL.isArray(u)if not hUL.isTable(u)then return false end;local J1Vn4uYP=0
for Z in OV7(u)do J1Vn4uYP=
J1Vn4uYP+1;if hUL.isNil(u[J1Vn4uYP])then return false end end;return true end
function hUL.isIterable(pJ)return hUL.toBoolean((v(OV7,pJ)))end
function hUL.isEmpty(NAjg)if hUL.isNil(NAjg)then return true end;if hUL.isString(NAjg)then return
#NAjg==0 end
if hUL.isTable(NAjg)then return XKD(NAjg)==nil end;return true end
function hUL.isString(con)return SWFtRywD(con)=='string'end
function hUL.isFunction(I)return SWFtRywD(I)=='function'end;function hUL.isNil(TxmZR6UE)return TxmZR6UE==nil end;function hUL.isNumber(I1b4o)return
SWFtRywD(I1b4o)=='number'end;function hUL.isNaN(nAt)return
hUL.isNumber(nAt)and nAt~=nAt end
function hUL.isFinite(pNJ)if
not hUL.isNumber(pNJ)then return false end;return pNJ>-toXyq and pNJ<
toXyq end
function hUL.isBoolean(RQ)return SWFtRywD(RQ)=='boolean'end;function hUL.isInteger(wnZcHKf)return
hUL.isNumber(wnZcHKf)and S9TO(wnZcHKf)==wnZcHKf end
do
hUL.forEach=hUL.each;hUL.forEachi=hUL.eachi;hUL.loop=hUL.cycle;hUL.collect=hUL.map
hUL.inject=hUL.reduce;hUL.foldl=hUL.reduce;hUL.injectr=hUL.reduceRight
hUL.foldr=hUL.reduceRight;hUL.mapr=hUL.mapReduce;hUL.maprr=hUL.mapReduceRight
hUL.any=hUL.include;hUL.some=hUL.include;hUL.contains=hUL.include;hUL.filter=hUL.select
hUL.discard=hUL.reject;hUL.every=hUL.all;hUL.takeWhile=hUL.selectWhile
hUL.rejectWhile=hUL.dropWhile;hUL.shift=hUL.pop;hUL.remove=hUL.pull;hUL.rmRange=hUL.removeRange
hUL.chop=hUL.removeRange;hUL.sub=hUL.slice;hUL.head=hUL.first;hUL.take=hUL.first
hUL.tail=hUL.rest;hUL.skip=hUL.last;hUL.without=hUL.difference;hUL.diff=hUL.difference
hUL.symdiff=hUL.symmetricDifference;hUL.xor=hUL.symmetricDifference;hUL.uniq=hUL.unique
hUL.isuniq=hUL.isunique;hUL.transpose=hUL.zip;hUL.part=hUL.partition;hUL.perm=hUL.permutation
hUL.mirror=hUL.invert;hUL.join=hUL.concat;hUL.cache=hUL.memoize;hUL.juxt=hUL.juxtapose
hUL.uid=hUL.uniqueId;hUL.iter=hUL.iterator;hUL.methods=hUL.functions;hUL.choose=hUL.pick
hUL.drop=hUL.omit;hUL.defaults=hUL.template;hUL.compare=hUL.isEqual end
do local Lv_8={}local UQ={}UQ.__index=Lv_8;local function FG(vLzqjJw)local v2dsC21={_value=vLzqjJw,_wrapped=true}return
l6Sm5(v2dsC21,UQ)end
l6Sm5(UQ,{__call=function(O,wx)
return FG(wx)end,__index=function(u,V_84V,...)return Lv_8[V_84V]end})function UQ.chain(qF)return FG(qF)end
function UQ:value()return self._value end;Lv_8.chain,Lv_8.value=UQ.chain,UQ.value
for IZbOX7TW,Dd6ZLpU in OV7(hUL)do
Lv_8[IZbOX7TW]=function(MP,...)
local w4c=
hUL.isTable(MP)and RlMSrmdD(MP,'_wrapped')or false;if w4c then local C58=MP._value;local Jk6Nh=Dd6ZLpU(C58,...)return FG(Jk6Nh)else
return Dd6ZLpU(MP,...)end end end
Lv_8.import=function(s1Ws,desLYv)s1Ws=s1Ws or _ENV or _G;local COq2NY9I=hUL.functions()
hUL.each(COq2NY9I,function(aoBEg65S,x6)
if
RlMSrmdD(s1Ws,x6)then if not desLYv then s1Ws[x6]=hUL[x6]end else s1Ws[x6]=hUL[x6]end end)return s1Ws end;UQ._VERSION='Moses v'..slo60nGX
UQ._URL='http://github.com/Yonaba/Moses'
UQ._LICENSE='MIT <http://raw.githubusercontent.com/Yonaba/Moses/master/LICENSE>'UQ._DESCRIPTION='utility-belt library for functional programming in Lua'
return UQ end