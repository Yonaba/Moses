local e='2.0.0'local v,l6Sm5,oUA,QFKEzBf=next,type,select,pcall
local odpE,p=setmetatable,getmetatable;local lIpFkbLI,JdUtcU=table.insert,table.sort
local GQLN,toXyq=table.remove,table.concat;local S9TO,pS78Y,BCf7=math.randomseed,math.random,math.huge
local RlMSrmdD,VCD,OV7,X83a=math.floor,math.max,math.min,math.ceil;local PizLA9mj=coroutine.wrap;local hUL=coroutine.yield;local l=rawget
local kyWtqIf0=table.unpack or unpack;local zupvsz,Mw=pairs,ipairs;local S1wg_DG=error;local sf0=os.clock;local qxZa6ozV={}local function hgW2H5(BKLwtAVx,BMZNmf0)
return BKLwtAVx>BMZNmf0 end
local function z5i2i(qL9C,Colg)return qL9C<Colg end
local function MGSnnzOI(ex2xo17)local I=0;for K66,Tq in zupvsz(ex2xo17)do I=I+1 end;return I end
local function B0o5xpg7(jmB,bjO,QoYPziln,...)QoYPziln=QoYPziln or qxZa6ozV.identity;local Hj
for KBlIVi,OR8it1 in zupvsz(jmB)do if not Hj then
Hj=QoYPziln(OR8it1,...)else local GAqAsa=QoYPziln(OR8it1,...)
Hj=bjO(Hj,GAqAsa)and Hj or GAqAsa end end;return Hj end
local function VQT(Oc_,Qj,Ybp8,ZmzyNm)
for akG0mUnS=0,#Oc_,Qj do
local iy=qxZa6ozV.slice(Oc_,akG0mUnS+1,akG0mUnS+Qj)if#iy>0 then
while(#iy<Qj and ZmzyNm)do iy[#iy+1]=ZmzyNm end;Ybp8(iy)end end end
local function Id(gc7SaW,FnbJWd2,cpdLk,FbQX)
for ejMVLYZd=0,#gc7SaW,FnbJWd2-1 do
local eS0X=qxZa6ozV.slice(gc7SaW,ejMVLYZd+1,ejMVLYZd+FnbJWd2)
if#eS0X>0 and ejMVLYZd+1 <#gc7SaW then while
(#eS0X<FnbJWd2 and FbQX)do eS0X[#eS0X+1]=FbQX end;cpdLk(eS0X)end end end
local function Ub(XDQS4ASf,IiNU,gUfudNUg,d3)
for gTOcAHv=0,#XDQS4ASf,1 do
local vY_4HT1n=qxZa6ozV.slice(XDQS4ASf,gTOcAHv+1,gTOcAHv+IiNU)
if#vY_4HT1n>0 and gTOcAHv+IiNU<=#XDQS4ASf then
while(#vY_4HT1n<
IiNU and d3)do vY_4HT1n[#vY_4HT1n+1]=d3 end;gUfudNUg(vY_4HT1n)end end end
local function qJExeUn2(DzPbzg,UMD,K3ZE7Ou)if UMD==0 then K3ZE7Ou(DzPbzg)end;for fBI=1,UMD do
DzPbzg[UMD],DzPbzg[fBI]=DzPbzg[fBI],DzPbzg[UMD]qJExeUn2(DzPbzg,UMD-1,K3ZE7Ou)
DzPbzg[UMD],DzPbzg[fBI]=DzPbzg[fBI],DzPbzg[UMD]end end;local function cmWo_v(wMSY)return wMSY>=0 and 1 or-1 end;local RoXZEsn=-1
qxZa6ozV.operator={}
qxZa6ozV.operator.add=function(_nD2rl,aVh8xSly)return _nD2rl+aVh8xSly end
qxZa6ozV.operator.sub=function(i,P_NNVDyt)return i-P_NNVDyt end
qxZa6ozV.operator.mul=function(cVEyN,uj2AiF)return cVEyN*uj2AiF end
qxZa6ozV.operator.div=function(W,lbHN2)return W/lbHN2 end
qxZa6ozV.operator.mod=function(PwgW3lfq,z)return PwgW3lfq%z end;qxZa6ozV.operator.exp=function(K,xx)return K^xx end
qxZa6ozV.operator.pow=qxZa6ozV.operator.exp;qxZa6ozV.operator.unm=function(aYb)return-aYb end
qxZa6ozV.operator.neg=qxZa6ozV.operator.unm
qxZa6ozV.operator.floordiv=function(JM2,bmAjLT)return RlMSrmdD(JM2/bmAjLT)end
qxZa6ozV.operator.intdiv=function(eExYnwnh,XMBmJyiP)
return
eExYnwnh>=0 and RlMSrmdD(eExYnwnh/XMBmJyiP)or X83a(eExYnwnh/XMBmJyiP)end
qxZa6ozV.operator.eq=function(nowqEU6m,iKD8V)return nowqEU6m==iKD8V end
qxZa6ozV.operator.neq=function(YtRS,A)return YtRS~=A end
qxZa6ozV.operator.lt=function(mHJ,Q57BJ)return mHJ<Q57BJ end
qxZa6ozV.operator.gt=function(vM,JeGCDX)return vM>JeGCDX end
qxZa6ozV.operator.le=function(A,UFZlp)return A<=UFZlp end
qxZa6ozV.operator.ge=function(VsrKM,uhIq)return VsrKM>=uhIq end
qxZa6ozV.operator.land=function(EEOUzhy,hbrt)return EEOUzhy and hbrt end;qxZa6ozV.operator.lor=function(D,Q)return D or Q end;qxZa6ozV.operator.lnot=function(mRqle)return
not mRqle end
qxZa6ozV.operator.concat=function(sBEZ8,WhHB0ygh)return
sBEZ8 ..WhHB0ygh end
qxZa6ozV.operator.length=function(rYSD0)return#rYSD0 end;qxZa6ozV.operator.len=qxZa6ozV.operator.length
function qxZa6ozV.clear(BIL5)for GQLlkH in
zupvsz(BIL5)do BIL5[GQLlkH]=nil end;return BIL5 end;function qxZa6ozV.each(aN4J2zRQ,eWca,...)
for AGUR2QK,FK in zupvsz(aN4J2zRQ)do eWca(FK,AGUR2QK,...)end end
function qxZa6ozV.eachi(_,YQZ729qQ,...)
local rZh2wG=qxZa6ozV.sort(qxZa6ozV.select(qxZa6ozV.keys(_),qxZa6ozV.isInteger))for sef4eW6Q,Z in Mw(rZh2wG)do YQZ729qQ(_[Z],Z,...)end end
function qxZa6ozV.at(UacO6D,...)local FdnzjW={}for o,lMAL in Mw({...})do
FdnzjW[#FdnzjW+1]=UacO6D[lMAL]end;return FdnzjW end
function qxZa6ozV.adjust(CpQ,L,HnQS_Z,...)if(CpQ[L]==nil)then
S1wg_DG("key not existing in table")end;local rib=qxZa6ozV.clone(CpQ)
rib[L]=
l6Sm5(HnQS_Z)=='function'and HnQS_Z(rib[L],...)or HnQS_Z;return rib end
function qxZa6ozV.count(w,YT6wZ)if YT6wZ==nil then return qxZa6ozV.size(w)end
local MGSnnzOI=0;for VYv,gU in zupvsz(w)do
if qxZa6ozV.isEqual(gU,YT6wZ)then MGSnnzOI=MGSnnzOI+1 end end;return MGSnnzOI end
function qxZa6ozV.countf(JzG8W4Ya,dZ54oc,...)local MGSnnzOI=0;for v_LoR,gRY in zupvsz(JzG8W4Ya)do if dZ54oc(gRY,v_LoR,...)then
MGSnnzOI=MGSnnzOI+1 end end;return
MGSnnzOI end
function qxZa6ozV.cycle(z,ad)ad=ad or 1;if ad<=0 then return qxZa6ozV.noop end;local Ui0Qa,g
local Itx=0
while true do
return
function()Ui0Qa=Ui0Qa and v(z,Ui0Qa)or v(z)
g=not g and Ui0Qa or g;if ad then Itx=(Ui0Qa==g)and Itx+1 or Itx
if Itx>ad then return end end;return z[Ui0Qa],Ui0Qa end end end
function qxZa6ozV.map(JpoaGH,cyAcCT,...)local RCA={}
for L46S,GKTYT in zupvsz(JpoaGH)do
local hXSTz8FJ,C24r7o4G,b_4Q38cU=L46S,cyAcCT(GKTYT,L46S,...)
RCA[b_4Q38cU and C24r7o4G or hXSTz8FJ]=b_4Q38cU or C24r7o4G end;return RCA end
function qxZa6ozV.reduce(N,JbPw,j)for S,cg4FV7bl in zupvsz(N)do
if j==nil then j=cg4FV7bl else j=JbPw(j,cg4FV7bl)end end;return j end
function qxZa6ozV.reduceby(flf9sWX,uNoS,ZWoH9V08,RWo,...)return
qxZa6ozV.reduce(qxZa6ozV.select(flf9sWX,ZWoH9V08,...),uNoS,RWo)end
function qxZa6ozV.reduceRight(GWBQL,PCldTUn9,sO_)return
qxZa6ozV.reduce(qxZa6ozV.reverse(GWBQL),PCldTUn9,sO_)end
function qxZa6ozV.mapReduce(ALbdmINL,b,DUgF0E)local vGxJ6f={}
for a4ga2I,syGyB_ in zupvsz(ALbdmINL)do vGxJ6f[a4ga2I]=not DUgF0E and syGyB_ or
b(DUgF0E,syGyB_)DUgF0E=vGxJ6f[a4ga2I]end;return vGxJ6f end
function qxZa6ozV.mapReduceRight(VO,J1r,iBcU3_7D)return
qxZa6ozV.mapReduce(qxZa6ozV.reverse(VO),J1r,iBcU3_7D)end
function qxZa6ozV.include(N,M4V)local _feve=(l6Sm5(M4V)=='function')and M4V or
qxZa6ozV.isEqual;for OPz_7bk,H64aD in zupvsz(N)do if
_feve(H64aD,M4V)then return true end end;return false end
function qxZa6ozV.detect(ny7,QDj6GAX)
local k6pXzd=
(l6Sm5(QDj6GAX)=='function')and QDj6GAX or qxZa6ozV.isEqual
for hsLwu,R in zupvsz(ny7)do if k6pXzd(R,QDj6GAX)then return hsLwu end end end
function qxZa6ozV.where(JKZ,yHbsh)
local d4z=qxZa6ozV.select(JKZ,function(i)
for HyEk4lbh in zupvsz(yHbsh)do if i[HyEk4lbh]~=yHbsh[HyEk4lbh]then return
false end end;return true end)return#d4z>0 and d4z or nil end
function qxZa6ozV.findWhere(PhU,rWwbNge)
local SKxD=qxZa6ozV.detect(PhU,function(o3uQKvJ)
for vAZm in zupvsz(rWwbNge)do if
rWwbNge[vAZm]~=o3uQKvJ[vAZm]then return false end end;return true end)return SKxD and PhU[SKxD]end
function qxZa6ozV.select(q,fFuE,...)local KypMW={}for JJT4nKO,TFLF in zupvsz(q)do if fFuE(TFLF,JJT4nKO,...)then
KypMW[#KypMW+1]=TFLF end end
return KypMW end
function qxZa6ozV.reject(hEoAa,PGN,...)local K2_kF5={}
for YpimJ,Gg7Ttui in zupvsz(hEoAa)do if not PGN(Gg7Ttui,YpimJ,...)then
K2_kF5[#K2_kF5+1]=Gg7Ttui end end;return K2_kF5 end
function qxZa6ozV.all(_,EGeAf,...)for ymP,z5pHKyoa in zupvsz(_)do
if not EGeAf(z5pHKyoa,ymP,...)then return false end end;return true end
function qxZa6ozV.invoke(h,xwT,...)local y33ux={...}
return
qxZa6ozV.map(h,function(Ut)
if(l6Sm5(Ut)=='table')then
if Ut[xwT]then
if
qxZa6ozV.isCallable(Ut[xwT])then return Ut[xwT](Ut,kyWtqIf0(y33ux))else return Ut[xwT]end else
if qxZa6ozV.isCallable(xwT)then return xwT(Ut,kyWtqIf0(y33ux))end end elseif qxZa6ozV.isCallable(xwT)then return xwT(Ut,kyWtqIf0(y33ux))end end)end
function qxZa6ozV.pluck(GOijBp,oUi)local b2a3={}for xer,SQHAAR in zupvsz(GOijBp)do if SQHAAR[oUi]then
b2a3[#b2a3+1]=SQHAAR[oUi]end end;return b2a3 end
function qxZa6ozV.max(qybRcP1,z,...)return B0o5xpg7(qybRcP1,hgW2H5,z,...)end
function qxZa6ozV.min(N0NaR,FBfW,...)return B0o5xpg7(N0NaR,z5i2i,FBfW,...)end
function qxZa6ozV.same(lnM4,_oDmX_)
return
qxZa6ozV.all(lnM4,function(t)return qxZa6ozV.include(_oDmX_,t)end)and
qxZa6ozV.all(_oDmX_,function(K)return qxZa6ozV.include(lnM4,K)end)end
function qxZa6ozV.sort(ppm021I,ASUXhD)JdUtcU(ppm021I,ASUXhD)return ppm021I end
function qxZa6ozV.sortBy(KCm,u,fDk)local gxYY=u or qxZa6ozV.identity
if
(l6Sm5(u)=='string')then gxYY=function(KCm)return KCm[u]end end;fDk=fDk or z5i2i
JdUtcU(KCm,function(sVMxk,SyD)return fDk(gxYY(sVMxk),gxYY(SyD))end)return KCm end
function qxZa6ozV.groupBy(v4,j7siW,...)local Hl={...}local AP060rq={}
for DIEKD10,lLJ in zupvsz(v4)do
local EicsS=j7siW(lLJ,DIEKD10,kyWtqIf0(Hl))if AP060rq[EicsS]then
AP060rq[EicsS][#AP060rq[EicsS]+1]=lLJ else AP060rq[EicsS]={lLJ}end end;return AP060rq end
function qxZa6ozV.countBy(JubU,L,...)local JKci={}
for SsBe,o in zupvsz(JubU)do local ZOmcmO=L(o,SsBe,...)JKci[ZOmcmO]=(
JKci[ZOmcmO]or 0)+1 end;return JKci end
function qxZa6ozV.size(...)local _G19JrRB={...}local m0r3_J=_G19JrRB[1]return

(l6Sm5(m0r3_J)=='table')and MGSnnzOI(_G19JrRB[1])or MGSnnzOI(_G19JrRB)end
function qxZa6ozV.containsKeys(MLrs,hP5)for oqjhEZb0 in zupvsz(hP5)do
if not MLrs[oqjhEZb0]then return false end end;return true end
function qxZa6ozV.sameKeys(Pha,G)
for MOrzq4 in zupvsz(Pha)do if not G[MOrzq4]then return false end end
for bEMp in zupvsz(G)do if not Pha[bEMp]then return false end end;return true end
function qxZa6ozV.sample(dd,MOQN,O)MOQN=MOQN or 1;if MOQN==0 then return{}end;if MOQN==1 then
if O then S9TO(O)end;return{dd[pS78Y(1,#dd)]}end;return
qxZa6ozV.slice(qxZa6ozV.shuffle(dd,O),1,MOQN)end
function qxZa6ozV.sampleProb(FEpet,P,G)if G then S9TO(G)end;local EcLLM={}for wo,ur in Mw(FEpet)do if pS78Y()<P then
EcLLM[#EcLLM+1]=ur end end;return EcLLM end
function qxZa6ozV.shuffle(XTX,wc8hjKp1)if wc8hjKp1 then S9TO(wc8hjKp1)end;local f={}
for Hjag,Yg in Mw(XTX)do local uc=RlMSrmdD(pS78Y()*
Hjag)+1;f[Hjag]=f[uc]f[uc]=Yg end;return f end;function qxZa6ozV.toArray(...)return{...}end;function qxZa6ozV.find(bw,ad,EG344W)
for MVlUhPEM=EG344W or 1,#bw do if
qxZa6ozV.isEqual(bw[MVlUhPEM],ad)then return MVlUhPEM end end end;function qxZa6ozV.reverse(LT)
local pfiWYrg={}
for smnX9H6=#LT,1,-1 do pfiWYrg[#pfiWYrg+1]=LT[smnX9H6]end;return pfiWYrg end
function qxZa6ozV.fill(FzRhHR,mMBxOoQa,xYSLIT,Eae7ILmk)Eae7ILmk=
Eae7ILmk or qxZa6ozV.size(FzRhHR)for xYSLIT=xYSLIT or 1,Eae7ILmk
do FzRhHR[xYSLIT]=mMBxOoQa end;return FzRhHR end
function qxZa6ozV.zeros(Jy23ZRAA)return qxZa6ozV.fill({},0,1,Jy23ZRAA)end
function qxZa6ozV.ones(V8IWw)return qxZa6ozV.fill({},1,1,V8IWw)end
function qxZa6ozV.vector(uyYdf,K)return qxZa6ozV.fill({},uyYdf,1,K)end
function qxZa6ozV.selectWhile(ZX,tbdC,...)local VaY3={}
for HK7Mbgze,VXPfx in Mw(ZX)do if tbdC(VXPfx,HK7Mbgze,...)then VaY3[HK7Mbgze]=VXPfx else
break end end;return VaY3 end
function qxZa6ozV.dropWhile(j3Qk,X1,...)local GpruB;for r,V7YqV in Mw(j3Qk)do
if not X1(V7YqV,r,...)then GpruB=r;break end end;if(GpruB==nil)then return{}end;return
qxZa6ozV.rest(j3Qk,GpruB)end
function qxZa6ozV.sortedIndex(JbvH7,Cqk9Luq,PeAP9X,vN5AF9)local j=PeAP9X or z5i2i;if(vN5AF9 ==true)then
JdUtcU(JbvH7,j)end;for EOgmP=1,#JbvH7 do
if not j(JbvH7[EOgmP],Cqk9Luq)then return EOgmP end end;return#JbvH7+1 end;function qxZa6ozV.indexOf(j,mJof)
for yz1Kuwby=1,#j do if j[yz1Kuwby]==mJof then return yz1Kuwby end end end
function qxZa6ozV.lastIndexOf(KVE6TG,YY)
local r9=qxZa6ozV.indexOf(qxZa6ozV.reverse(KVE6TG),YY)if r9 then return#KVE6TG-r9+1 end end
function qxZa6ozV.findIndex(mtUG,PFRuf,...)for KhK1gRj9=1,#mtUG do
if PFRuf(mtUG[KhK1gRj9],KhK1gRj9,...)then return KhK1gRj9 end end end
function qxZa6ozV.findLastIndex(Xgj,Ko,...)
local A=qxZa6ozV.findIndex(qxZa6ozV.reverse(Xgj),Ko,...)if A then return#Xgj-A+1 end end;function qxZa6ozV.addTop(IU6Om,...)
for sKIIqz,wmhARqEa in Mw({...})do lIpFkbLI(IU6Om,1,wmhARqEa)end;return IU6Om end;function qxZa6ozV.prepend(_RT3,...)return
qxZa6ozV.append({...},_RT3)end
function qxZa6ozV.push(V,...)local BTA={...}for QVEYENaX,gxqa in
Mw({...})do V[#V+1]=gxqa end;return V end
function qxZa6ozV.shift(q4,QyKi)QyKi=OV7(QyKi or 1,#q4)local _o3FE={}for n=1,QyKi do local WM=q4[1]
_o3FE[#_o3FE+1]=WM;GQLN(q4,1)end;return kyWtqIf0(_o3FE)end
function qxZa6ozV.unshift(zb8b,YBqeh)YBqeh=OV7(YBqeh or 1,#zb8b)local WRkIg={}
for RH_vLUg=1,YBqeh do
local aEH=zb8b[#zb8b]WRkIg[#WRkIg+1]=aEH;GQLN(zb8b)end;return kyWtqIf0(WRkIg)end
function qxZa6ozV.pull(g20N7,...)
for puZN,_Dy in Mw({...})do for MC=#g20N7,1,-1 do if qxZa6ozV.isEqual(g20N7[MC],_Dy)then
GQLN(g20N7,MC)end end end;return g20N7 end
function qxZa6ozV.removeRange(WOBSVeqF,A,vqW6)A=A or 1;vqW6=vqW6 or#WOBSVeqF;if A>vqW6 then
S1wg_DG("start cannot be greater than finish.")end
for R4oRlgh=vqW6,A,-1 do GQLN(WOBSVeqF,R4oRlgh)end;return WOBSVeqF end
function qxZa6ozV.chunk(rBRXA,qfFSJN,...)local Va8fT08T,d778,aZT,ni9je9bJ={},0
for uwwNE,X40cF in Mw(rBRXA)do
ni9je9bJ=qfFSJN(X40cF,uwwNE,...)aZT=(aZT==nil)and ni9je9bJ or aZT
d778=(
(ni9je9bJ~=aZT)and(d778+1)or d778)if not Va8fT08T[d778]then Va8fT08T[d778]={rBRXA[uwwNE]}else
Va8fT08T[d778][
#Va8fT08T[d778]+1]=rBRXA[uwwNE]end;aZT=ni9je9bJ end;return Va8fT08T end
function qxZa6ozV.slice(EW,asgq,IQybL1)local hYKT45={}for Rq7=asgq or 1,IQybL1 or#EW do
hYKT45[#hYKT45+1]=EW[Rq7]end;return hYKT45 end
function qxZa6ozV.first(LQ_EIcl,uaL)uaL=uaL or 1;local gujcrFp={}for ph06vXj=1,uaL do
gujcrFp[ph06vXj]=LQ_EIcl[ph06vXj]end;return gujcrFp end
function qxZa6ozV.initial(nH0LB4c,ALwJ9)local _X=#nH0LB4c;ALwJ9=
ALwJ9 and _X- (OV7(ALwJ9,_X))or _X-1;local ruXMob={}for E=1,ALwJ9 do
ruXMob[E]=nH0LB4c[E]end;return ruXMob end
function qxZa6ozV.last(jcgjAE,BZmaGN)local HSav=#jcgjAE;BZmaGN=
BZmaGN and HSav-OV7(BZmaGN-1,HSav-1)or 2;local sDjMr={}for biQX3Ut=BZmaGN,HSav do
sDjMr[#sDjMr+1]=jcgjAE[biQX3Ut]end;return sDjMr end
function qxZa6ozV.rest(BLEXN_,Ljc)local fpN7T={}for FNSk_=Ljc or 1,#BLEXN_ do
fpN7T[#fpN7T+1]=BLEXN_[FNSk_]end;return fpN7T end;function qxZa6ozV.nth(LmE,pZTFVP)return LmE[pZTFVP]end
function qxZa6ozV.compact(XL)
local L5vC0Jx={}
for vpONJ,A in zupvsz(XL)do if A then L5vC0Jx[#L5vC0Jx+1]=A end end;return L5vC0Jx end
function qxZa6ozV.flatten(LN,dA14qP)dA14qP=dA14qP or false;local JcQc;local hDih6_D={}
for QKbZ464i,F1TsZ in Mw(LN)do
if
l6Sm5(F1TsZ)=='table'then
JcQc=dA14qP and F1TsZ or qxZa6ozV.flatten(F1TsZ)for uF2,T in Mw(JcQc)do hDih6_D[#hDih6_D+1]=T end else hDih6_D[#
hDih6_D+1]=F1TsZ end end;return hDih6_D end
function qxZa6ozV.difference(pC_,ju)if not ju then return qxZa6ozV.clone(pC_)end;return
qxZa6ozV.select(pC_,function(deu1)return
not qxZa6ozV.include(ju,deu1)end)end;function qxZa6ozV.union(...)
return qxZa6ozV.unique(qxZa6ozV.flatten({...}))end
function qxZa6ozV.intersection(IgZ6,...)local kVRiv3F={...}local kWMf={}
for DawC,cP in
Mw(IgZ6)do if
qxZa6ozV.all(kVRiv3F,function(w)return qxZa6ozV.include(w,cP)end)then kWMf[#kWMf+1]=cP end end;return kWMf end
function qxZa6ozV.symmetricDifference(UZ,tdH)return
qxZa6ozV.difference(qxZa6ozV.union(UZ,tdH),qxZa6ozV.intersection(UZ,tdH))end
function qxZa6ozV.unique(ymt)local WxGA={}
for jBuHkH=1,#ymt do if
not qxZa6ozV.find(WxGA,ymt[jBuHkH])then WxGA[#WxGA+1]=ymt[jBuHkH]end end;return WxGA end;function qxZa6ozV.isunique(E3)
return#E3 ==# (qxZa6ozV.unique(E3))end
function qxZa6ozV.zip(...)local CZi_zK={...}local _6KCMph=qxZa6ozV.max(CZi_zK,function(V)
return#V end)local PY3VqYZ8={}
for y=1,_6KCMph
do if not PY3VqYZ8[y]then PY3VqYZ8[y]={}end;for QF,hN in Mw(CZi_zK)do
if hN[y]then PY3VqYZ8[y][
#PY3VqYZ8[y]+1]=hN[y]end end end;return PY3VqYZ8 end
function qxZa6ozV.zipWith(hVflx4kh,...)local GP={...}
local oCZYv2dT=qxZa6ozV.max(GP,function(PoH)return#PoH end)local RLaqM3={}for xM709D=1,oCZYv2dT do
RLaqM3[xM709D]=hVflx4kh(kyWtqIf0(qxZa6ozV.pluck(GP,xM709D)))end;return RLaqM3 end
function qxZa6ozV.append(z50,sAPD)local AVFi={}for GGKI,gWaGu in Mw(z50)do AVFi[GGKI]=gWaGu end;for SFKM,j6jQmlbr in
Mw(sAPD)do AVFi[#AVFi+1]=j6jQmlbr end;return AVFi end
function qxZa6ozV.interleave(...)local m403CY={...}
local dL=qxZa6ozV.max(m403CY,qxZa6ozV.size)local PrTsHeT={}for eNI3MT7=1,dL do
for Rfoo,eUJhGD in Mw(m403CY)do if eUJhGD[eNI3MT7]then
PrTsHeT[#PrTsHeT+1]=eUJhGD[eNI3MT7]end end end;return PrTsHeT end;function qxZa6ozV.interpose(wot8,j9vJ)
for J6Qr27Mh=#wot8,2,-1 do lIpFkbLI(wot8,J6Qr27Mh,j9vJ)end;return wot8 end
function qxZa6ozV.range(AwxW8Do,_u,B)
if(
AwxW8Do==nil)and(_u==nil)and(B==nil)then return{}elseif(
AwxW8Do~=nil)and(_u==nil)and(B==nil)then
AwxW8Do,_u,B=cmWo_v(AwxW8Do),AwxW8Do,cmWo_v(AwxW8Do)elseif(AwxW8Do~=nil)and(_u~=nil)and(B==nil)then B=cmWo_v(_u-
AwxW8Do)end;local cdxFVpZw={AwxW8Do}
local Y=VCD(RlMSrmdD((_u-AwxW8Do)/B),0)
for o9Uh=1,Y do cdxFVpZw[#cdxFVpZw+1]=AwxW8Do+B*o9Uh end;return cdxFVpZw end
function qxZa6ozV.rep(BuX1r,Wyf83f2)local P0olj={}for z=1,Wyf83f2 do P0olj[z]=BuX1r end;return P0olj end
function qxZa6ozV.powerset(EHCCkt)local x=#EHCCkt;if x==0 then return{{}}end;local xNWVmS={}
for kGWnkgDu=1,x do for Pkis6H28=1,x-kGWnkgDu+1
do
xNWVmS[#xNWVmS+1]=qxZa6ozV.slice(EHCCkt,Pkis6H28,Pkis6H28+kGWnkgDu-1)end end;return xNWVmS end
function qxZa6ozV.partition(tSE,abKH,LDp)if abKH<=0 then return end;return PizLA9mj(function()
VQT(tSE,abKH or 1,hUL,LDp)end)end;function qxZa6ozV.overlapping(GWouUlzZ,MqJhIr,Q9)if MqJhIr<=1 then return end
return PizLA9mj(function()
Id(GWouUlzZ,MqJhIr or 2,hUL,Q9)end)end
function qxZa6ozV.aperture(c,qnZ81I)if
qnZ81I<=1 then return end;return
PizLA9mj(function()Ub(c,qnZ81I or 2,hUL)end)end
function qxZa6ozV.pairwise(N9uN)return qxZa6ozV.aperture(N9uN,2)end;function qxZa6ozV.permutation(QGC)return
PizLA9mj(function()qJExeUn2(QGC,#QGC,hUL)end)end
function qxZa6ozV.invert(K8iFU)
local gbU={}for h,hS7 in Mw(K8iFU)do gbU[hS7]=h end;return gbU end
function qxZa6ozV.concat(KQjMKhN,R6PYgHHE,ZwCXrLO,lI)return
toXyq(qxZa6ozV.map(KQjMKhN,tostring),R6PYgHHE,ZwCXrLO,lI)end
function qxZa6ozV.xprod(iMSMP5Lp,WoARZdZ3)local n={}for Uj,HpN_N in Mw(iMSMP5Lp)do
for yP3QEJ,pwi in Mw(WoARZdZ3)do n[#n+1]={HpN_N,pwi}end end;return n end
function qxZa6ozV.sum(QP)local Iy=0;for O9P0mj,eFGwPxi in Mw(QP)do Iy=Iy+eFGwPxi end;return Iy end;function qxZa6ozV.product(m4x8ZsD4)local _witc0Pe=1
for Y8E,h in Mw(m4x8ZsD4)do _witc0Pe=_witc0Pe*h end;return _witc0Pe end
function qxZa6ozV.mean(EnMMG)return
qxZa6ozV.sum(EnMMG)/ (#EnMMG)end
function qxZa6ozV.median(HzO7UpZ)
local B=qxZa6ozV.sort(qxZa6ozV.clone(HzO7UpZ))local RNTu=#B;if RNTu==0 then return elseif RNTu==1 then return B[1]end
local Q_=X83a(RNTu/2)return
RNTu%2 ==0 and(B[Q_]+B[Q_+1])/2 or B[Q_]end;function qxZa6ozV.noop()return end;function qxZa6ozV.identity(S8GB)return S8GB end;function qxZa6ozV.constant(W7yjGm)return function()return
W7yjGm end end
function qxZa6ozV.applySpec(X)return
function(...)
local Y={}for qqvEf3,Wriu in zupvsz(X)do Y[qqvEf3]=Wriu(...)end;return Y end end
function qxZa6ozV.memoize(I0Pxr5F,ukGf_)local uZpt01P=odpE({},{__mode='kv'})
local hJk0n8bR=ukGf_ or qxZa6ozV.identity;return
function(...)local o9DTTJig=hJk0n8bR(...)local v4=uZpt01P[o9DTTJig]if not v4 then
uZpt01P[o9DTTJig]=I0Pxr5F(...)end;return uZpt01P[o9DTTJig]end end
function qxZa6ozV.unfold(Uaq2_Xzk,S0DM)local GHasi5,QeX_U9tm={}
while true do QeX_U9tm,S0DM=Uaq2_Xzk(S0DM)if QeX_U9tm~=nil then GHasi5[#
GHasi5+1]=QeX_U9tm else break end end;return GHasi5 end
function qxZa6ozV.once(Dp9m)local sJjNM=0;local GnSs={}
return function(...)sJjNM=sJjNM+1;if sJjNM<=1 then GnSs={...}end;return
Dp9m(kyWtqIf0(GnSs))end end
function qxZa6ozV.before(XP,MGSnnzOI)local Sj=0;local yKj1={}
return function(...)Sj=Sj+1;if Sj<=MGSnnzOI then yKj1={...}end;return
XP(kyWtqIf0(yKj1))end end
function qxZa6ozV.after(F9WZ,MGSnnzOI)local A5,nY_O=MGSnnzOI,0;return function(...)nY_O=nY_O+1
if nY_O>=A5 then return F9WZ(...)end end end
function qxZa6ozV.compose(...)local QAJAyj5=qxZa6ozV.reverse{...}
return function(...)local EZ,n=true
for M,AADiL1 in
Mw(QAJAyj5)do if EZ then EZ=false;n=AADiL1(...)else n=AADiL1(n)end end;return n end end
function qxZa6ozV.pipe(Arw,...)return qxZa6ozV.compose(...)(Arw)end
function qxZa6ozV.complement(b)return function(...)return not b(...)end end
function qxZa6ozV.juxtapose(_ZM1Yj3,...)local rmSU={}
for L2RHrI,XW7Y5Rz in Mw({...})do rmSU[L2RHrI]=XW7Y5Rz(_ZM1Yj3)end;return kyWtqIf0(rmSU)end
function qxZa6ozV.wrap(C,NhwEkTd)return function(...)return NhwEkTd(C,...)end end
function qxZa6ozV.times(XGz,Tf4P2eIf,...)local TF3Htu={}for K5yUw1t=1,(Tf4P2eIf or 1)do
TF3Htu[K5yUw1t]=XGz(K5yUw1t,...)end;return TF3Htu end;function qxZa6ozV.bind(Mi,WWyrqnSL)
return function(...)return Mi(WWyrqnSL,...)end end
function qxZa6ozV.bind2(gVTyP,Ck)return function(CRG,...)
return gVTyP(CRG,Ck,...)end end;function qxZa6ozV.bindn(dkz,...)local zrCq={...}
return function(...)return
dkz(kyWtqIf0(qxZa6ozV.append(zrCq,{...})))end end
function qxZa6ozV.bindall(azXMvVdM,...)
local CBgxHfbq={...}
for WO,H in Mw(CBgxHfbq)do local C28NuJ3=azXMvVdM[H]if C28NuJ3 then
azXMvVdM[H]=qxZa6ozV.bind(C28NuJ3,azXMvVdM)end end;return azXMvVdM end;function qxZa6ozV.cond(sz)
return function(...)
for qH,u in Mw(sz)do if u[1](...)then return u[2](...)end end end end
function qxZa6ozV.uniqueId(u,...)RoXZEsn=
RoXZEsn+1;if u then
if l6Sm5(u)=='string'then return u:format(RoXZEsn)elseif l6Sm5(u)==
'function'then return u(RoXZEsn,...)end end;return RoXZEsn end
function qxZa6ozV.iterator(J1Vn4uYP,Z,pJ)local MGSnnzOI=0
return function()MGSnnzOI=MGSnnzOI+1
if pJ and MGSnnzOI>pJ then return end;Z=J1Vn4uYP(Z)return Z end end
function qxZa6ozV.array(...)local NAjg={}for con in...do NAjg[#NAjg+1]=con end;return NAjg end;function qxZa6ozV.castArray(I)
return(l6Sm5(I)~='table')and{I}or I end;function qxZa6ozV.flip(TxmZR6UE)
return function(...)return
TxmZR6UE(kyWtqIf0(qxZa6ozV.reverse({...})))end end;function qxZa6ozV.nthArg(I1b4o)
return function(...)
local nAt={...}return
nAt[(I1b4o<0)and(#nAt+I1b4o+1)or I1b4o]end end
function qxZa6ozV.unary(pNJ)return function(...)
local RQ={...}return pNJ(RQ[1])end end
function qxZa6ozV.ary(wnZcHKf,Lv_8)Lv_8=Lv_8 or 1;return
function(...)local UQ={...}local FG={}for vLzqjJw=1,Lv_8 do
FG[vLzqjJw]=UQ[vLzqjJw]end;return wnZcHKf(kyWtqIf0(FG))end end
function qxZa6ozV.rearg(v2dsC21,O)
return function(...)local wx={...}local u={}for V_84V,qF in Mw(O)do u[V_84V]=wx[qF]end;return
v2dsC21(kyWtqIf0(u))end end
function qxZa6ozV.over(...)local IZbOX7TW={...}return
function(...)local Dd6ZLpU={}for MP,w4c in Mw(IZbOX7TW)do
Dd6ZLpU[#Dd6ZLpU+1]=w4c(...)end;return Dd6ZLpU end end
function qxZa6ozV.overEvery(...)local C58=qxZa6ozV.over(...)
return function(...)
return qxZa6ozV.reduce(C58(...),function(Jk6Nh,s1Ws)return
Jk6Nh and s1Ws end)end end
function qxZa6ozV.overSome(...)local desLYv=qxZa6ozV.over(...)return
function(...)return
qxZa6ozV.reduce(desLYv(...),function(COq2NY9I,aoBEg65S)return COq2NY9I or
aoBEg65S end)end end
function qxZa6ozV.overArgs(x6,...)local t3cNa2l={...}
return
function(...)local Ik={...}
for SeHOs=1,#t3cNa2l do local x6=t3cNa2l[SeHOs]if
Ik[SeHOs]then Ik[SeHOs]=x6(Ik[SeHOs])end end;return x6(kyWtqIf0(Ik))end end
function qxZa6ozV.converge(P2rGsUx,c,v12AhMm)return
function(...)return P2rGsUx(c(...),v12AhMm(...))end end
function qxZa6ozV.partial(F2uxGC,...)local Xs0={...}
return
function(...)local QK8ibF={...}local TEio7k0z={}
for u,N in Mw(Xs0)do TEio7k0z[u]=(N=='_')and
qxZa6ozV.shift(QK8ibF)or N end;return
F2uxGC(kyWtqIf0(qxZa6ozV.append(TEio7k0z,QK8ibF)))end end
function qxZa6ozV.partialRight(O2YgxDc,...)local VLsC67={...}
return
function(...)local OHw4={...}local FKZ={}for Fl=1,#VLsC67 do
FKZ[Fl]=
(VLsC67[Fl]=='_')and qxZa6ozV.shift(OHw4)or VLsC67[Fl]end;return
O2YgxDc(kyWtqIf0(qxZa6ozV.append(OHw4,FKZ)))end end
function qxZa6ozV.curry(QhS8FvKI,FaZIJL)FaZIJL=FaZIJL or 2;local sOT2O5={}
local function x(Wswd_OC)if FaZIJL==1 then
return QhS8FvKI(Wswd_OC)end
if Wswd_OC~=nil then sOT2O5[#sOT2O5+1]=Wswd_OC end
if#sOT2O5 <FaZIJL then return x else
local E={QhS8FvKI(kyWtqIf0(sOT2O5))}sOT2O5={}return kyWtqIf0(E)end end;return x end;function qxZa6ozV.time(A0Un,...)local nRHrI=sf0()local k={A0Un(...)}
return sf0()-nRHrI,kyWtqIf0(k)end
function qxZa6ozV.keys(Zp)local A={}for _L_ in
zupvsz(Zp)do A[#A+1]=_L_ end;return A end;function qxZa6ozV.values(WHpm)local g={}
for HiR3yiw,KeKbiDqN in zupvsz(WHpm)do g[#g+1]=KeKbiDqN end;return g end
function qxZa6ozV.path(WfrZqHH8,...)
local YX9s9O,y64dF=WfrZqHH8,{...}
for sNSsH,K in Mw(y64dF)do if(YX9s9O[K]==nil)then return end;YX9s9O=YX9s9O[K]end;return YX9s9O end;function qxZa6ozV.kvpairs(o8T)local xeP={}
for Tv_3VlmX,BT in zupvsz(o8T)do xeP[#xeP+1]={Tv_3VlmX,BT}end;return xeP end;function qxZa6ozV.toObj(_y3z)
local rdl={}for NAP_5jYs,BZnlpW in Mw(_y3z)do rdl[BZnlpW[1]]=BZnlpW[2]end;return
rdl end
function qxZa6ozV.property(isN)return function(yRADzw1v)return
yRADzw1v[isN]end end;function qxZa6ozV.propertyOf(Jafp)
return function(XWh8Ee)return Jafp[XWh8Ee]end end;function qxZa6ozV.toBoolean(kpezL1e)
return not not kpezL1e end
function qxZa6ozV.extend(h,...)local R7yfz_l9={...}for D35PFLu,wK in Mw(R7yfz_l9)do
if
l6Sm5(wK)=='table'then for qeEwE,cbtvFnSa in zupvsz(wK)do h[qeEwE]=cbtvFnSa end end end;return h end
function qxZa6ozV.functions(fYKH_,W)fYKH_=fYKH_ or qxZa6ozV;local o={}
for Mm99M,l6YH in zupvsz(fYKH_)do if
l6Sm5(l6YH)=='function'then o[#o+1]=Mm99M end end
if W then local gf2=p(fYKH_)
if gf2 and gf2.__index then
local F744Ew=qxZa6ozV.functions(gf2.__index,W)for zgxKF4,UlvVvSBR in Mw(F744Ew)do o[#o+1]=UlvVvSBR end end end;return o end
function qxZa6ozV.clone(i2i,uRGAL)if l6Sm5(i2i)~='table'then return i2i end;local UUlqXyb6={}
for fOR92g8,jU26 in
zupvsz(i2i)do
if l6Sm5(jU26)=='table'then
if not uRGAL then
UUlqXyb6[fOR92g8]=qxZa6ozV.clone(jU26,uRGAL)else UUlqXyb6[fOR92g8]=jU26 end else UUlqXyb6[fOR92g8]=jU26 end end;return UUlqXyb6 end
function qxZa6ozV.tap(WIPTsAPz,DgUx8,...)DgUx8(WIPTsAPz,...)return WIPTsAPz end;function qxZa6ozV.has(imac,xX)return imac[xX]~=nil end
function qxZa6ozV.pick(Mfb6Kb,...)
local RRjV=qxZa6ozV.flatten{...}local TDOaFo={}for tLo4,m72l in zupvsz(RRjV)do if(Mfb6Kb[m72l])~=nil then
TDOaFo[m72l]=Mfb6Kb[m72l]end end;return
TDOaFo end
function qxZa6ozV.omit(npM3DSU,...)local HGp4e1=qxZa6ozV.flatten{...}local uzJt7E={}
for sRe5S32N,Bp in
zupvsz(npM3DSU)do if not qxZa6ozV.include(HGp4e1,sRe5S32N)then
uzJt7E[sRe5S32N]=Bp end end;return uzJt7E end
function qxZa6ozV.template(rg,S)if not S then return rg end;for Fem,cHmVGY in zupvsz(S)do
if not rg[Fem]then rg[Fem]=cHmVGY end end;return rg end
function qxZa6ozV.isEqual(g29sXR,Vat,sfnkWAy8)local hbJSGe9=l6Sm5(g29sXR)local pI=l6Sm5(Vat)
if hbJSGe9 ~=pI then return false end;if hbJSGe9 ~='table'then return(g29sXR==Vat)end
local B7jhm=p(g29sXR)local hj3=p(Vat)if sfnkWAy8 then
if
(B7jhm or hj3)and(B7jhm.__eq or hj3.__eq)then return B7jhm.__eq(g29sXR,Vat)or hj3.__eq(Vat,g29sXR)or
(g29sXR==Vat)end end
if
qxZa6ozV.size(g29sXR)~=qxZa6ozV.size(Vat)then return false end;local FKxU4;for UW,tReY in zupvsz(g29sXR)do FKxU4=Vat[UW]
if FKxU4 ==nil or not
qxZa6ozV.isEqual(tReY,FKxU4,sfnkWAy8)then return false end end;for lex in zupvsz(Vat)do if
g29sXR[lex]==nil then return false end end;return
true end
function qxZa6ozV.result(h79Pm,vksQpy4,...)if h79Pm[vksQpy4]then
if qxZa6ozV.isCallable(h79Pm[vksQpy4])then return
h79Pm[vksQpy4](h79Pm,...)else return h79Pm[vksQpy4]end end;if
qxZa6ozV.isCallable(vksQpy4)then return vksQpy4(h79Pm,...)end end
function qxZa6ozV.isTable(gPCIWPt)return l6Sm5(gPCIWPt)=='table'end
function qxZa6ozV.isCallable(l4Byxa7)return
((l6Sm5(l4Byxa7)=='function')or
(
(l6Sm5(l4Byxa7)=='table')and p(l4Byxa7)and p(l4Byxa7).__call~=nil)or false)end
function qxZa6ozV.isArray(Fn8OR)
if not(l6Sm5(Fn8OR)=='table')then return false end;local X1Z0van=0;for C_ACFsd in zupvsz(Fn8OR)do X1Z0van=X1Z0van+1
if Fn8OR[X1Z0van]==nil then return false end end;return true end;function qxZa6ozV.isIterable(GC)
return qxZa6ozV.toBoolean((QFKEzBf(zupvsz,GC)))end
function qxZa6ozV.isEmpty(SC7gSvMB)if(SC7gSvMB==nil)then
return true end
if l6Sm5(SC7gSvMB)=='string'then return#SC7gSvMB==0 end
if l6Sm5(SC7gSvMB)=='table'then return v(SC7gSvMB)==nil end;return true end
function qxZa6ozV.isString(Ei)return l6Sm5(Ei)=='string'end
function qxZa6ozV.isFunction(GFuK1ut)return l6Sm5(GFuK1ut)=='function'end;function qxZa6ozV.isNil(SXmRY3i)return SXmRY3i==nil end;function qxZa6ozV.isNumber(b)return
l6Sm5(b)=='number'end
function qxZa6ozV.isNaN(KApFr)return
l6Sm5(KApFr)=='number'and KApFr~=KApFr end
function qxZa6ozV.isFinite(jE)if l6Sm5(jE)~='number'then return false end;return jE>-BCf7 and jE<
BCf7 end
function qxZa6ozV.isBoolean(yVVmXC)return l6Sm5(yVVmXC)=='boolean'end
function qxZa6ozV.isInteger(MkxwoCeK)return l6Sm5(MkxwoCeK)=='number'and
RlMSrmdD(MkxwoCeK)==MkxwoCeK end
do qxZa6ozV.forEach=qxZa6ozV.each
qxZa6ozV.forEachi=qxZa6ozV.eachi;qxZa6ozV.update=qxZa6ozV.adjust;qxZa6ozV.loop=qxZa6ozV.cycle
qxZa6ozV.collect=qxZa6ozV.map;qxZa6ozV.inject=qxZa6ozV.reduce
qxZa6ozV.foldl=qxZa6ozV.reduce;qxZa6ozV.injectr=qxZa6ozV.reduceRight
qxZa6ozV.foldr=qxZa6ozV.reduceRight;qxZa6ozV.mapr=qxZa6ozV.mapReduce
qxZa6ozV.maprr=qxZa6ozV.mapReduceRight;qxZa6ozV.any=qxZa6ozV.include;qxZa6ozV.some=qxZa6ozV.include
qxZa6ozV.contains=qxZa6ozV.include;qxZa6ozV.filter=qxZa6ozV.select
qxZa6ozV.discard=qxZa6ozV.reject;qxZa6ozV.every=qxZa6ozV.all
qxZa6ozV.takeWhile=qxZa6ozV.selectWhile;qxZa6ozV.rejectWhile=qxZa6ozV.dropWhile
qxZa6ozV.pop=qxZa6ozV.shift;qxZa6ozV.remove=qxZa6ozV.pull
qxZa6ozV.rmRange=qxZa6ozV.removeRange;qxZa6ozV.chop=qxZa6ozV.removeRange
qxZa6ozV.sub=qxZa6ozV.slice;qxZa6ozV.head=qxZa6ozV.first;qxZa6ozV.take=qxZa6ozV.first
qxZa6ozV.tail=qxZa6ozV.rest;qxZa6ozV.skip=qxZa6ozV.last
qxZa6ozV.without=qxZa6ozV.difference;qxZa6ozV.diff=qxZa6ozV.difference
qxZa6ozV.symdiff=qxZa6ozV.symmetricDifference;qxZa6ozV.xor=qxZa6ozV.symmetricDifference
qxZa6ozV.uniq=qxZa6ozV.unique;qxZa6ozV.isuniq=qxZa6ozV.isunique
qxZa6ozV.transpose=qxZa6ozV.zip;qxZa6ozV.part=qxZa6ozV.partition
qxZa6ozV.perm=qxZa6ozV.permutation;qxZa6ozV.transposeWith=qxZa6ozV.zipWith
qxZa6ozV.intersperse=qxZa6ozV.interpose;qxZa6ozV.sliding=qxZa6ozV.aperture
qxZa6ozV.mirror=qxZa6ozV.invert;qxZa6ozV.join=qxZa6ozV.concat;qxZa6ozV.average=qxZa6ozV.mean
qxZa6ozV.always=qxZa6ozV.constant;qxZa6ozV.cache=qxZa6ozV.memoize
qxZa6ozV.juxt=qxZa6ozV.juxtapose;qxZa6ozV.uid=qxZa6ozV.uniqueid
qxZa6ozV.iter=qxZa6ozV.iterator;qxZa6ozV.tabulate=qxZa6ozV.array;qxZa6ozV.nAry=qxZa6ozV.ary
qxZa6ozV.methods=qxZa6ozV.functions;qxZa6ozV.choose=qxZa6ozV.pick;qxZa6ozV.drop=qxZa6ozV.omit
qxZa6ozV.defaults=qxZa6ozV.template;qxZa6ozV.compare=qxZa6ozV.isEqual
qxZa6ozV.matches=qxZa6ozV.isEqual end
do local AT={}local _8KO={}_8KO.__index=AT;local function NI(PE)
return odpE({_value=PE,_wrapped=true},_8KO)end
odpE(_8KO,{__call=function(a,GhVWeuQs)return NI(GhVWeuQs)end,__index=function(kQlY,xIl1shq,...)return
AT[xIl1shq]end})function _8KO.chain(qv)return NI(qv)end
function _8KO:value()return self._value end;AT.chain,AT.value=_8KO.chain,_8KO.value
for pbEt6T,MBdHQ in zupvsz(qxZa6ozV)do
if
pbEt6T~='operator'then
AT[pbEt6T]=function(STXAhhM,...)local assFn=
l6Sm5(STXAhhM)=='table'and l(STXAhhM,'_wrapped')or false
if assFn then
local EXpWzv=STXAhhM._value;local kq=MBdHQ(EXpWzv,...)return NI(kq)else return MBdHQ(STXAhhM,...)end end end end;AT.operator=qxZa6ozV.operator;AT.op=qxZa6ozV.operator
AT.import=function(up,wlI_l)up=
up or _ENV or _G;local nK7J=qxZa6ozV.functions()for xv,IWG in Mw(nK7J)do
if
l(up,IWG)~=nil then
if not wlI_l then rawset(up,IWG,qxZa6ozV[IWG])end else rawset(up,IWG,qxZa6ozV[IWG])end end;return up end;_8KO._VERSION='Moses v'..e
_8KO._URL='http://github.com/Yonaba/Moses'
_8KO._LICENSE='MIT <http://raw.githubusercontent.com/Yonaba/Moses/master/LICENSE>'
_8KO._DESCRIPTION='utility-belt library for functional programming in Lua'return _8KO end