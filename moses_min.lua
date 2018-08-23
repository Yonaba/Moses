local SWFtRywD='2.0.0'local e,v,l6Sm5=next,type,pcall;local oUA,QFKEzBf=setmetatable,getmetatable
local odpE,p=table.insert,table.sort;local lIpFkbLI,JdUtcU=table.remove,table.concat
local GQLN,toXyq,S9TO=math.randomseed,math.random,math.huge;local pS78Y,BCf7,RlMSrmdD,VCD=math.floor,math.max,math.min,math.ceil
local OV7=coroutine.wrap;local X83a=coroutine.yield;local PizLA9mj=rawget
local hUL=table.unpack or unpack;local l,kyWtqIf0=pairs,ipairs;local zupvsz=error;local Mw=os.clock;local S1wg_DG={}local function sf0(cmWo_v,RoXZEsn)
return cmWo_v>RoXZEsn end
local function qxZa6ozV(BKLwtAVx,BMZNmf0)return BKLwtAVx<BMZNmf0 end
local function hgW2H5(qL9C)local Colg=0;for ex2xo17,I in l(qL9C)do Colg=Colg+1 end;return Colg end
local function z5i2i(K66,Tq,jmB,...)jmB=jmB or S1wg_DG.identity;local bjO;for QoYPziln,Hj in l(K66)do
if not bjO then bjO=jmB(Hj,...)else
local KBlIVi=jmB(Hj,...)bjO=Tq(bjO,KBlIVi)and bjO or KBlIVi end end;return bjO end
local function MGSnnzOI(OR8it1,GAqAsa,Oc_,Qj)
for Ybp8=0,#OR8it1,GAqAsa do
local ZmzyNm=S1wg_DG.slice(OR8it1,Ybp8+1,Ybp8+GAqAsa)
if#ZmzyNm>0 then while(#ZmzyNm<GAqAsa and Qj)do
ZmzyNm[#ZmzyNm+1]=Qj end;Oc_(ZmzyNm)end end end
local function B0o5xpg7(akG0mUnS,iy,gc7SaW,FnbJWd2)
for cpdLk=0,#akG0mUnS,iy-1 do
local FbQX=S1wg_DG.slice(akG0mUnS,cpdLk+1,cpdLk+iy)if#FbQX>0 and cpdLk+1 <#akG0mUnS then while
(#FbQX<iy and FnbJWd2)do FbQX[#FbQX+1]=FnbJWd2 end
gc7SaW(FbQX)end end end
local function VQT(ejMVLYZd,eS0X,XDQS4ASf,IiNU)
for gUfudNUg=0,#ejMVLYZd,1 do
local d3=S1wg_DG.slice(ejMVLYZd,gUfudNUg+1,gUfudNUg+eS0X)
if#d3 >0 and gUfudNUg+eS0X<=#ejMVLYZd then while
(#d3 <eS0X and IiNU)do d3[#d3+1]=IiNU end;XDQS4ASf(d3)end end end
local function Id(gTOcAHv,vY_4HT1n,DzPbzg)if vY_4HT1n==0 then DzPbzg(gTOcAHv)end
for UMD=1,vY_4HT1n do
gTOcAHv[vY_4HT1n],gTOcAHv[UMD]=gTOcAHv[UMD],gTOcAHv[vY_4HT1n]Id(gTOcAHv,vY_4HT1n-1,DzPbzg)
gTOcAHv[vY_4HT1n],gTOcAHv[UMD]=gTOcAHv[UMD],gTOcAHv[vY_4HT1n]end end;local function Ub(K3ZE7Ou)return K3ZE7Ou>=0 and 1 or-1 end
local qJExeUn2=-1;S1wg_DG.operator={}
S1wg_DG.operator.add=function(fBI,wMSY)return fBI+wMSY end
S1wg_DG.operator.sub=function(_nD2rl,aVh8xSly)return _nD2rl-aVh8xSly end
S1wg_DG.operator.mul=function(i,P_NNVDyt)return i*P_NNVDyt end
S1wg_DG.operator.div=function(cVEyN,uj2AiF)return cVEyN/uj2AiF end
S1wg_DG.operator.mod=function(W,lbHN2)return W%lbHN2 end
S1wg_DG.operator.exp=function(PwgW3lfq,z)return PwgW3lfq^z end;S1wg_DG.operator.pow=S1wg_DG.operator.exp;S1wg_DG.operator.unm=function(K)return
-K end
S1wg_DG.operator.neg=S1wg_DG.operator.unm
S1wg_DG.operator.floordiv=function(xx,aYb)return pS78Y(xx/aYb)end
S1wg_DG.operator.intdiv=function(JM2,bmAjLT)return JM2 >=0 and pS78Y(JM2/bmAjLT)or
VCD(JM2/bmAjLT)end
S1wg_DG.operator.eq=function(eExYnwnh,XMBmJyiP)return eExYnwnh==XMBmJyiP end
S1wg_DG.operator.neq=function(nowqEU6m,iKD8V)return nowqEU6m~=iKD8V end
S1wg_DG.operator.lt=function(YtRS,A)return YtRS<A end
S1wg_DG.operator.gt=function(mHJ,Q57BJ)return mHJ>Q57BJ end
S1wg_DG.operator.le=function(vM,JeGCDX)return vM<=JeGCDX end
S1wg_DG.operator.ge=function(A,UFZlp)return A>=UFZlp end
S1wg_DG.operator.land=function(VsrKM,uhIq)return VsrKM and uhIq end
S1wg_DG.operator.lor=function(EEOUzhy,hbrt)return EEOUzhy or hbrt end;S1wg_DG.operator.lnot=function(D)return not D end;S1wg_DG.operator.concat=function(Q,mRqle)return
Q..mRqle end;S1wg_DG.operator.length=function(sBEZ8)return
#sBEZ8 end
S1wg_DG.operator.len=S1wg_DG.operator.length;function S1wg_DG.clear(WhHB0ygh)for rYSD0 in l(WhHB0ygh)do WhHB0ygh[rYSD0]=nil end
return WhHB0ygh end
function S1wg_DG.each(BIL5,GQLlkH,...)for aN4J2zRQ,eWca in l(BIL5)do
GQLlkH(eWca,aN4J2zRQ,...)end end
function S1wg_DG.eachi(AGUR2QK,FK,...)
local _=S1wg_DG.sort(S1wg_DG.select(S1wg_DG.keys(AGUR2QK),S1wg_DG.isInteger))
for YQZ729qQ,rZh2wG in kyWtqIf0(_)do FK(AGUR2QK[rZh2wG],rZh2wG,...)end end;function S1wg_DG.at(sef4eW6Q,...)local Z={}
for UacO6D,FdnzjW in kyWtqIf0({...})do Z[#Z+1]=sef4eW6Q[FdnzjW]end;return Z end
function S1wg_DG.adjust(o,lMAL,CpQ,...)
if(
o[lMAL]==nil)then zupvsz("key not existing in table")end;local L=S1wg_DG.clone(o)L[lMAL]=
v(CpQ)=='function'and CpQ(L[lMAL],...)or CpQ;return L end
function S1wg_DG.count(HnQS_Z,rib)
if rib==nil then return S1wg_DG.size(HnQS_Z)end;local hgW2H5=0;for w,YT6wZ in l(HnQS_Z)do
if S1wg_DG.isEqual(YT6wZ,rib)then hgW2H5=hgW2H5+1 end end;return hgW2H5 end
function S1wg_DG.countf(VYv,gU,...)local hgW2H5=0;for JzG8W4Ya,dZ54oc in l(VYv)do
if gU(dZ54oc,JzG8W4Ya,...)then hgW2H5=hgW2H5+1 end end;return hgW2H5 end
function S1wg_DG.cycle(v_LoR,gRY)gRY=gRY or 1;if gRY<=0 then return S1wg_DG.noop end;local z,ad
local Ui0Qa=0
while true do
return
function()z=z and e(v_LoR,z)or e(v_LoR)
ad=not ad and z or ad;if gRY then Ui0Qa=(z==ad)and Ui0Qa+1 or Ui0Qa
if Ui0Qa>gRY then return end end;return v_LoR[z],z end end end
function S1wg_DG.map(g,Itx,...)local JpoaGH={}for cyAcCT,RCA in l(g)do local L46S,GKTYT,hXSTz8FJ=cyAcCT,Itx(RCA,cyAcCT,...)
JpoaGH[hXSTz8FJ and
GKTYT or L46S]=hXSTz8FJ or GKTYT end
return JpoaGH end;function S1wg_DG.reduce(C24r7o4G,b_4Q38cU,N)
for JbPw,j in l(C24r7o4G)do if N==nil then N=j else N=b_4Q38cU(N,j)end end;return N end
function S1wg_DG.reduceby(S,cg4FV7bl,flf9sWX,uNoS,...)return
S1wg_DG.reduce(S1wg_DG.select(S,flf9sWX,...),cg4FV7bl,uNoS)end
function S1wg_DG.reduceRight(ZWoH9V08,RWo,GWBQL)return
S1wg_DG.reduce(S1wg_DG.reverse(ZWoH9V08),RWo,GWBQL)end
function S1wg_DG.mapReduce(PCldTUn9,sO_,ALbdmINL)local b={}
for DUgF0E,vGxJ6f in l(PCldTUn9)do b[DUgF0E]=not ALbdmINL and vGxJ6f or
sO_(ALbdmINL,vGxJ6f)ALbdmINL=b[DUgF0E]end;return b end
function S1wg_DG.mapReduceRight(a4ga2I,syGyB_,VO)return
S1wg_DG.mapReduce(S1wg_DG.reverse(a4ga2I),syGyB_,VO)end
function S1wg_DG.include(J1r,iBcU3_7D)local N=(v(iBcU3_7D)=='function')and iBcU3_7D or
S1wg_DG.isEqual;for M4V,_feve in l(J1r)do if
N(_feve,iBcU3_7D)then return true end end;return false end
function S1wg_DG.detect(OPz_7bk,H64aD)
local ny7=(v(H64aD)=='function')and H64aD or S1wg_DG.isEqual
for QDj6GAX,k6pXzd in l(OPz_7bk)do if ny7(k6pXzd,H64aD)then return QDj6GAX end end end
function S1wg_DG.where(hsLwu,R)
local JKZ=S1wg_DG.select(hsLwu,function(yHbsh)for d4z in l(R)do
if yHbsh[d4z]~=R[d4z]then return false end end;return true end)return#JKZ>0 and JKZ or nil end
function S1wg_DG.findWhere(i,HyEk4lbh)
local PhU=S1wg_DG.detect(i,function(rWwbNge)for SKxD in l(HyEk4lbh)do if HyEk4lbh[SKxD]~=rWwbNge[SKxD]then
return false end end
return true end)return PhU and i[PhU]end
function S1wg_DG.select(o3uQKvJ,vAZm,...)local q={}for fFuE,KypMW in l(o3uQKvJ)do
if vAZm(KypMW,fFuE,...)then q[#q+1]=KypMW end end;return q end
function S1wg_DG.reject(JJT4nKO,TFLF,...)local hEoAa={}
for PGN,K2_kF5 in l(JJT4nKO)do if not TFLF(K2_kF5,PGN,...)then
hEoAa[#hEoAa+1]=K2_kF5 end end;return hEoAa end
function S1wg_DG.all(YpimJ,Gg7Ttui,...)for _,EGeAf in l(YpimJ)do
if not Gg7Ttui(EGeAf,_,...)then return false end end;return true end
function S1wg_DG.invoke(ymP,z5pHKyoa,...)local h={...}
return
S1wg_DG.map(ymP,function(xwT)
if(v(xwT)=='table')then
if xwT[z5pHKyoa]then
if
S1wg_DG.isCallable(xwT[z5pHKyoa])then return xwT[z5pHKyoa](xwT,hUL(h))else return xwT[z5pHKyoa]end else
if S1wg_DG.isCallable(z5pHKyoa)then return z5pHKyoa(xwT,hUL(h))end end elseif S1wg_DG.isCallable(z5pHKyoa)then return z5pHKyoa(xwT,hUL(h))end end)end
function S1wg_DG.pluck(y33ux,Ut)local GOijBp={}for oUi,b2a3 in l(y33ux)do if b2a3[Ut]then
GOijBp[#GOijBp+1]=b2a3[Ut]end end;return GOijBp end
function S1wg_DG.max(xer,SQHAAR,...)return z5i2i(xer,sf0,SQHAAR,...)end
function S1wg_DG.min(qybRcP1,z,...)return z5i2i(qybRcP1,qxZa6ozV,z,...)end
function S1wg_DG.same(N0NaR,FBfW)
return
S1wg_DG.all(N0NaR,function(lnM4)return S1wg_DG.include(FBfW,lnM4)end)and
S1wg_DG.all(FBfW,function(_oDmX_)return S1wg_DG.include(N0NaR,_oDmX_)end)end;function S1wg_DG.sort(tK,ppm021I)p(tK,ppm021I)return tK end
function S1wg_DG.sortBy(ASUXhD,KCm,u)local fDk=KCm or
S1wg_DG.identity;if(v(KCm)=='string')then
fDk=function(ASUXhD)return ASUXhD[KCm]end end;u=u or qxZa6ozV
p(ASUXhD,function(gxYY,sVMxk)return
u(fDk(gxYY),fDk(sVMxk))end)return ASUXhD end
function S1wg_DG.groupBy(SyD,v4,...)local j7siW={...}local Hl={}
for AP060rq,DIEKD10 in l(SyD)do
local lLJ=v4(DIEKD10,AP060rq,hUL(j7siW))if Hl[lLJ]then Hl[lLJ][#Hl[lLJ]+1]=DIEKD10 else
Hl[lLJ]={DIEKD10}end end;return Hl end
function S1wg_DG.countBy(EicsS,JubU,...)local L={}for JKci,SsBe in l(EicsS)do local o=JubU(SsBe,JKci,...)
L[o]=(L[o]or 0)+1 end;return L end
function S1wg_DG.size(...)local ZOmcmO={...}local _G19JrRB=ZOmcmO[1]return

(v(_G19JrRB)=='table')and hgW2H5(ZOmcmO[1])or hgW2H5(ZOmcmO)end;function S1wg_DG.containsKeys(m0r3_J,MLrs)
for hP5 in l(MLrs)do if not m0r3_J[hP5]then return false end end;return true end
function S1wg_DG.sameKeys(oqjhEZb0,Pha)for G in
l(oqjhEZb0)do if not Pha[G]then return false end end
for MOrzq4 in l(Pha)do if not
oqjhEZb0[MOrzq4]then return false end end;return true end
function S1wg_DG.sample(bEMp,dd,MOQN)dd=dd or 1;if dd==0 then return{}end
if dd==1 then
if MOQN then GQLN(MOQN)end;return{bEMp[toXyq(1,#bEMp)]}end
return S1wg_DG.slice(S1wg_DG.shuffle(bEMp,MOQN),1,dd)end
function S1wg_DG.sampleProb(O,FEpet,P)if P then GQLN(P)end;local G={}for EcLLM,wo in kyWtqIf0(O)do if toXyq()<FEpet then
G[#G+1]=wo end end;return G end
function S1wg_DG.shuffle(ur,XTX)if XTX then GQLN(XTX)end;local wc8hjKp1={}for f,Hjag in kyWtqIf0(ur)do local Yg=
pS78Y(toXyq()*f)+1;wc8hjKp1[f]=wc8hjKp1[Yg]
wc8hjKp1[Yg]=Hjag end;return wc8hjKp1 end;function S1wg_DG.toArray(...)return{...}end;function S1wg_DG.find(uc,bw,ad)
for EG344W=ad or 1,#uc do if
S1wg_DG.isEqual(uc[EG344W],bw)then return EG344W end end end;function S1wg_DG.reverse(MVlUhPEM)
local LT={}
for pfiWYrg=#MVlUhPEM,1,-1 do LT[#LT+1]=MVlUhPEM[pfiWYrg]end;return LT end
function S1wg_DG.fill(smnX9H6,FzRhHR,mMBxOoQa,xYSLIT)xYSLIT=
xYSLIT or S1wg_DG.size(smnX9H6)for mMBxOoQa=mMBxOoQa or 1,xYSLIT do
smnX9H6[mMBxOoQa]=FzRhHR end;return smnX9H6 end
function S1wg_DG.zeros(Eae7ILmk)return S1wg_DG.fill({},0,1,Eae7ILmk)end
function S1wg_DG.ones(Jy23ZRAA)return S1wg_DG.fill({},1,1,Jy23ZRAA)end
function S1wg_DG.vector(V8IWw,uyYdf)return S1wg_DG.fill({},V8IWw,1,uyYdf)end
function S1wg_DG.selectWhile(K,ZX,...)local tbdC={}for VaY3,HK7Mbgze in kyWtqIf0(K)do
if ZX(HK7Mbgze,VaY3,...)then tbdC[VaY3]=HK7Mbgze else break end end;return tbdC end
function S1wg_DG.dropWhile(VXPfx,j3Qk,...)local X1;for GpruB,r in kyWtqIf0(VXPfx)do
if not j3Qk(r,GpruB,...)then X1=GpruB;break end end;if(X1 ==nil)then return{}end;return
S1wg_DG.rest(VXPfx,X1)end
function S1wg_DG.sortedIndex(V7YqV,JbvH7,Cqk9Luq,PeAP9X)local vN5AF9=Cqk9Luq or qxZa6ozV;if(PeAP9X==true)then
p(V7YqV,vN5AF9)end;for j=1,#V7YqV do
if not vN5AF9(V7YqV[j],JbvH7)then return j end end;return#V7YqV+1 end;function S1wg_DG.indexOf(EOgmP,j)
for mJof=1,#EOgmP do if EOgmP[mJof]==j then return mJof end end end
function S1wg_DG.lastIndexOf(yz1Kuwby,KVE6TG)
local YY=S1wg_DG.indexOf(S1wg_DG.reverse(yz1Kuwby),KVE6TG)if YY then return#yz1Kuwby-YY+1 end end;function S1wg_DG.findIndex(r9,mtUG,...)
for PFRuf=1,#r9 do if mtUG(r9[PFRuf],PFRuf,...)then return PFRuf end end end
function S1wg_DG.findLastIndex(KhK1gRj9,Xgj,...)
local Ko=S1wg_DG.findIndex(S1wg_DG.reverse(KhK1gRj9),Xgj,...)if Ko then return#KhK1gRj9-Ko+1 end end;function S1wg_DG.addTop(A,...)
for IU6Om,sKIIqz in kyWtqIf0({...})do odpE(A,1,sKIIqz)end;return A end;function S1wg_DG.prepend(wmhARqEa,...)return
S1wg_DG.append({...},wmhARqEa)end;function S1wg_DG.push(_RT3,...)
local V={...}
for BTA,QVEYENaX in kyWtqIf0({...})do _RT3[#_RT3+1]=QVEYENaX end;return _RT3 end
function S1wg_DG.shift(gxqa,q4)q4=RlMSrmdD(
q4 or 1,#gxqa)local QyKi={}for _o3FE=1,q4 do local n=gxqa[1]
QyKi[#QyKi+1]=n;lIpFkbLI(gxqa,1)end;return hUL(QyKi)end
function S1wg_DG.unshift(WM,zb8b)zb8b=RlMSrmdD(zb8b or 1,#WM)local YBqeh={}
for WRkIg=1,zb8b do
local RH_vLUg=WM[#WM]YBqeh[#YBqeh+1]=RH_vLUg;lIpFkbLI(WM)end;return hUL(YBqeh)end
function S1wg_DG.pull(aEH,...)
for g20N7,puZN in kyWtqIf0({...})do for _Dy=#aEH,1,-1 do if S1wg_DG.isEqual(aEH[_Dy],puZN)then
lIpFkbLI(aEH,_Dy)end end end;return aEH end
function S1wg_DG.removeRange(MC,WOBSVeqF,A)WOBSVeqF=WOBSVeqF or 1;A=A or#MC;if WOBSVeqF>A then
zupvsz("start cannot be greater than finish.")end
for vqW6=A,WOBSVeqF,-1 do lIpFkbLI(MC,vqW6)end;return MC end
function S1wg_DG.chunk(R4oRlgh,rBRXA,...)local qfFSJN,Va8fT08T,d778,aZT={},0
for ni9je9bJ,uwwNE in kyWtqIf0(R4oRlgh)do
aZT=rBRXA(uwwNE,ni9je9bJ,...)d778=(d778 ==nil)and aZT or d778
Va8fT08T=(
(aZT~=d778)and(Va8fT08T+1)or Va8fT08T)if not qfFSJN[Va8fT08T]then
qfFSJN[Va8fT08T]={R4oRlgh[ni9je9bJ]}else
qfFSJN[Va8fT08T][#qfFSJN[Va8fT08T]+1]=R4oRlgh[ni9je9bJ]end;d778=aZT end;return qfFSJN end
function S1wg_DG.slice(X40cF,EW,asgq)local IQybL1={}for hYKT45=EW or 1,asgq or#X40cF do
IQybL1[#IQybL1+1]=X40cF[hYKT45]end;return IQybL1 end
function S1wg_DG.first(Rq7,LQ_EIcl)LQ_EIcl=LQ_EIcl or 1;local uaL={}for gujcrFp=1,LQ_EIcl do
uaL[gujcrFp]=Rq7[gujcrFp]end;return uaL end
function S1wg_DG.initial(ph06vXj,nH0LB4c)local ALwJ9=#ph06vXj
nH0LB4c=nH0LB4c and
ALwJ9- (RlMSrmdD(nH0LB4c,ALwJ9))or ALwJ9-1;local _X={}for ruXMob=1,nH0LB4c do _X[ruXMob]=ph06vXj[ruXMob]end
return _X end
function S1wg_DG.last(E,jcgjAE)local BZmaGN=#E
jcgjAE=jcgjAE and
BZmaGN-RlMSrmdD(jcgjAE-1,BZmaGN-1)or 2;local HSav={}for sDjMr=jcgjAE,BZmaGN do HSav[#HSav+1]=E[sDjMr]end;return
HSav end;function S1wg_DG.rest(biQX3Ut,BLEXN_)local Ljc={}
for fpN7T=BLEXN_ or 1,#biQX3Ut do Ljc[#Ljc+1]=biQX3Ut[fpN7T]end;return Ljc end;function S1wg_DG.nth(FNSk_,LmE)return
FNSk_[LmE]end
function S1wg_DG.compact(pZTFVP)local XL={}for L5vC0Jx,vpONJ in l(pZTFVP)do if vpONJ then
XL[#XL+1]=vpONJ end end;return XL end
function S1wg_DG.flatten(A,LN)LN=LN or false;local dA14qP;local JcQc={}
for hDih6_D,QKbZ464i in kyWtqIf0(A)do
if v(QKbZ464i)=='table'then
dA14qP=
LN and QKbZ464i or S1wg_DG.flatten(QKbZ464i)for F1TsZ,uF2 in kyWtqIf0(dA14qP)do JcQc[#JcQc+1]=uF2 end else JcQc[
#JcQc+1]=QKbZ464i end end;return JcQc end
function S1wg_DG.difference(T,pC_)if not pC_ then return S1wg_DG.clone(T)end;return
S1wg_DG.select(T,function(ju)return
not S1wg_DG.include(pC_,ju)end)end;function S1wg_DG.union(...)
return S1wg_DG.unique(S1wg_DG.flatten({...}))end
function S1wg_DG.intersection(deu1,...)local IgZ6={...}local kVRiv3F={}for kWMf,DawC in
kyWtqIf0(deu1)do
if
S1wg_DG.all(IgZ6,function(cP)return S1wg_DG.include(cP,DawC)end)then kVRiv3F[#kVRiv3F+1]=DawC end end
return kVRiv3F end
function S1wg_DG.symmetricDifference(w,UZ)return
S1wg_DG.difference(S1wg_DG.union(w,UZ),S1wg_DG.intersection(w,UZ))end
function S1wg_DG.unique(tdH)local ymt={}for WxGA=1,#tdH do if not S1wg_DG.find(ymt,tdH[WxGA])then
ymt[#ymt+1]=tdH[WxGA]end end;return
ymt end;function S1wg_DG.isunique(jBuHkH)return
#jBuHkH==# (S1wg_DG.unique(jBuHkH))end
function S1wg_DG.zip(...)
local E3={...}
local CZi_zK=S1wg_DG.max(E3,function(PY3VqYZ8)return#PY3VqYZ8 end)local _6KCMph={}
for V=1,CZi_zK do if not _6KCMph[V]then _6KCMph[V]={}end;for y,QF in kyWtqIf0(E3)do
if
QF[V]then _6KCMph[V][#_6KCMph[V]+1]=QF[V]end end end;return _6KCMph end
function S1wg_DG.zipWith(hN,...)local hVflx4kh={...}
local GP=S1wg_DG.max(hVflx4kh,function(RLaqM3)return#RLaqM3 end)local oCZYv2dT={}for PoH=1,GP do
oCZYv2dT[PoH]=hN(hUL(S1wg_DG.pluck(hVflx4kh,PoH)))end;return oCZYv2dT end
function S1wg_DG.append(xM709D,z50)local sAPD={}
for AVFi,GGKI in kyWtqIf0(xM709D)do sAPD[AVFi]=GGKI end;for gWaGu,SFKM in kyWtqIf0(z50)do sAPD[#sAPD+1]=SFKM end
return sAPD end
function S1wg_DG.interleave(...)local j6jQmlbr={...}
local m403CY=S1wg_DG.max(j6jQmlbr,S1wg_DG.size)local dL={}
for PrTsHeT=1,m403CY do for eNI3MT7,Rfoo in kyWtqIf0(j6jQmlbr)do
if Rfoo[PrTsHeT]then dL[#dL+1]=Rfoo[PrTsHeT]end end end;return dL end;function S1wg_DG.interpose(eUJhGD,wot8)
for j9vJ=#eUJhGD,2,-1 do odpE(eUJhGD,j9vJ,wot8)end;return eUJhGD end
function S1wg_DG.range(J6Qr27Mh,AwxW8Do,_u)
if
(
J6Qr27Mh==nil)and(AwxW8Do==nil)and(_u==nil)then return{}elseif
(J6Qr27Mh~=nil)and(AwxW8Do==nil)and(_u==nil)then J6Qr27Mh,AwxW8Do,_u=Ub(J6Qr27Mh),J6Qr27Mh,Ub(J6Qr27Mh)elseif
(J6Qr27Mh~=nil)and(AwxW8Do~=nil)and(_u==nil)then _u=Ub(AwxW8Do-
J6Qr27Mh)end;local B={J6Qr27Mh}
local cdxFVpZw=BCf7(pS78Y((AwxW8Do-J6Qr27Mh)/_u),0)for Y=1,cdxFVpZw do B[#B+1]=J6Qr27Mh+_u*Y end;return B end;function S1wg_DG.rep(o9Uh,BuX1r)local Wyf83f2={}for P0olj=1,BuX1r do Wyf83f2[P0olj]=o9Uh end
return Wyf83f2 end
function S1wg_DG.powerset(z)
local EHCCkt=#z;if EHCCkt==0 then return{{}}end;local x={}for xNWVmS=1,EHCCkt do
for kGWnkgDu=1,EHCCkt-xNWVmS+1 do x[#x+1]=S1wg_DG.slice(z,kGWnkgDu,
kGWnkgDu+xNWVmS-1)end end;return x end;function S1wg_DG.partition(Pkis6H28,tSE,abKH)if tSE<=0 then return end
return OV7(function()
MGSnnzOI(Pkis6H28,tSE or 1,X83a,abKH)end)end;function S1wg_DG.overlapping(LDp,GWouUlzZ,MqJhIr)if
GWouUlzZ<=1 then return end
return OV7(function()
B0o5xpg7(LDp,GWouUlzZ or 2,X83a,MqJhIr)end)end;function S1wg_DG.aperture(Q9,c)if
c<=1 then return end;return
OV7(function()VQT(Q9,c or 2,X83a)end)end;function S1wg_DG.pairwise(qnZ81I)return
S1wg_DG.aperture(qnZ81I,2)end
function S1wg_DG.permutation(N9uN)return OV7(function()
Id(N9uN,#N9uN,X83a)end)end;function S1wg_DG.invert(QGC)local K8iFU={}for gbU,h in kyWtqIf0(QGC)do K8iFU[h]=gbU end
return K8iFU end
function S1wg_DG.concat(hS7,KQjMKhN,R6PYgHHE,ZwCXrLO)return
JdUtcU(S1wg_DG.map(hS7,tostring),KQjMKhN,R6PYgHHE,ZwCXrLO)end
function S1wg_DG.xprod(lI,iMSMP5Lp)local WoARZdZ3={}
for n,Uj in kyWtqIf0(lI)do for HpN_N,yP3QEJ in kyWtqIf0(iMSMP5Lp)do
WoARZdZ3[#WoARZdZ3+1]={Uj,yP3QEJ}end end;return WoARZdZ3 end
function S1wg_DG.sum(pwi)local QP=0;for Iy,O9P0mj in kyWtqIf0(pwi)do QP=QP+O9P0mj end;return QP end
function S1wg_DG.product(eFGwPxi)local m4x8ZsD4=1
for _witc0Pe,Y8E in kyWtqIf0(eFGwPxi)do m4x8ZsD4=m4x8ZsD4*Y8E end;return m4x8ZsD4 end
function S1wg_DG.mean(h)return S1wg_DG.sum(h)/ (#h)end
function S1wg_DG.median(EnMMG)
local HzO7UpZ=S1wg_DG.sort(S1wg_DG.clone(EnMMG))local B=#HzO7UpZ;if B==0 then return elseif B==1 then return HzO7UpZ[1]end
local RNTu=VCD(B/2)
return B%2 ==0 and
(HzO7UpZ[RNTu]+HzO7UpZ[RNTu+1])/2 or HzO7UpZ[RNTu]end;function S1wg_DG.noop()return end;function S1wg_DG.identity(Q_)return Q_ end;function S1wg_DG.constant(S8GB)return function()return
S8GB end end
function S1wg_DG.applySpec(W7yjGm)return
function(...)
local X={}for Y,qqvEf3 in l(W7yjGm)do X[Y]=qqvEf3(...)end;return X end end
function S1wg_DG.memoize(Wriu)local I0Pxr5F=oUA({},{__mode='kv'})
return function(ukGf_)if
(I0Pxr5F[ukGf_]==nil)then I0Pxr5F[ukGf_]=Wriu(ukGf_)end;return
I0Pxr5F[ukGf_]end end
function S1wg_DG.unfold(uZpt01P,hJk0n8bR)local o9DTTJig,v4={}
while true do v4,hJk0n8bR=uZpt01P(hJk0n8bR)if v4 ~=nil then o9DTTJig[
#o9DTTJig+1]=v4 else break end end;return o9DTTJig end
function S1wg_DG.once(Uaq2_Xzk)local S0DM=0;local GHasi5={}
return function(...)S0DM=S0DM+1;if S0DM<=1 then GHasi5={...}end;return
Uaq2_Xzk(hUL(GHasi5))end end
function S1wg_DG.before(QeX_U9tm,hgW2H5)local Dp9m=0;local sJjNM={}return
function(...)Dp9m=Dp9m+1
if Dp9m<=hgW2H5 then sJjNM={...}end;return QeX_U9tm(hUL(sJjNM))end end
function S1wg_DG.after(GnSs,hgW2H5)local XP,Sj=hgW2H5,0;return
function(...)Sj=Sj+1;if Sj>=XP then return GnSs(...)end end end
function S1wg_DG.compose(...)local yKj1=S1wg_DG.reverse{...}
return
function(...)local F9WZ,A5=true;for nY_O,QAJAyj5 in
kyWtqIf0(yKj1)do
if F9WZ then F9WZ=false;A5=QAJAyj5(...)else A5=QAJAyj5(A5)end end;return A5 end end
function S1wg_DG.pipe(EZ,...)return S1wg_DG.compose(...)(EZ)end
function S1wg_DG.complement(n)return function(...)return not n(...)end end
function S1wg_DG.juxtapose(M,...)local AADiL1={}
for Arw,b in kyWtqIf0({...})do AADiL1[Arw]=b(M)end;return hUL(AADiL1)end;function S1wg_DG.wrap(_ZM1Yj3,rmSU)
return function(...)return rmSU(_ZM1Yj3,...)end end;function S1wg_DG.times(L2RHrI,XW7Y5Rz,...)local C={}for NhwEkTd=1,(XW7Y5Rz or 1)
do C[NhwEkTd]=L2RHrI(NhwEkTd,...)end
return C end
function S1wg_DG.bind(XGz,Tf4P2eIf)return function(...)return
XGz(Tf4P2eIf,...)end end;function S1wg_DG.bind2(TF3Htu,K5yUw1t)
return function(Mi,...)return TF3Htu(Mi,K5yUw1t,...)end end;function S1wg_DG.bindn(WWyrqnSL,...)local gVTyP={...}
return function(...)return
WWyrqnSL(hUL(S1wg_DG.append(gVTyP,{...})))end end
function S1wg_DG.bindall(Ck,...)
local CRG={...}
for dkz,zrCq in kyWtqIf0(CRG)do local azXMvVdM=Ck[zrCq]if azXMvVdM then
Ck[zrCq]=S1wg_DG.bind(azXMvVdM,Ck)end end;return Ck end;function S1wg_DG.cond(CBgxHfbq)
return function(...)
for WO,H in kyWtqIf0(CBgxHfbq)do if H[1](...)then return H[2](...)end end end end
function S1wg_DG.uniqueId(C28NuJ3,...)qJExeUn2=
qJExeUn2+1;if C28NuJ3 then
if v(C28NuJ3)=='string'then
return C28NuJ3:format(qJExeUn2)elseif v(C28NuJ3)=='function'then return C28NuJ3(qJExeUn2,...)end end;return
qJExeUn2 end
function S1wg_DG.iterator(sz,qH,u)local uJ1Vn4uYP=0
return function()uJ1Vn4uYP=uJ1Vn4uYP+1
if u and uJ1Vn4uYP>u then return end;qH=sz(qH)return qH end end
function S1wg_DG.array(...)local Z={}for pJ in...do Z[#Z+1]=pJ end;return Z end;function S1wg_DG.castArray(NAjg)return
(v(NAjg)~='table')and{NAjg}or NAjg end;function S1wg_DG.flip(con)
return function(...)return
con(hUL(S1wg_DG.reverse({...})))end end;function S1wg_DG.nthArg(I)
return function(...)local TxmZR6UE={...}return
TxmZR6UE[(
I<0)and(#TxmZR6UE+I+1)or I]end end;function S1wg_DG.unary(I1b4o)
return function(...)
local nAt={...}return I1b4o(nAt[1])end end
function S1wg_DG.ary(pNJ,RQ)RQ=RQ or 1
return function(...)
local wnZcHKf={...}local Lv_8={}for UQ=1,RQ do Lv_8[UQ]=wnZcHKf[UQ]end
return pNJ(hUL(Lv_8))end end
function S1wg_DG.rearg(FG,vLzqjJw)return
function(...)local v2dsC21={...}local O={}
for wx,u in kyWtqIf0(vLzqjJw)do O[wx]=v2dsC21[u]end;return FG(hUL(O))end end
function S1wg_DG.over(...)local V_84V={...}return
function(...)local qF={}for IZbOX7TW,Dd6ZLpU in kyWtqIf0(V_84V)do
qF[#qF+1]=Dd6ZLpU(...)end;return qF end end
function S1wg_DG.overEvery(...)local MP=S1wg_DG.over(...)
return function(...)
return S1wg_DG.reduce(MP(...),function(w4c,C58)
return w4c and C58 end)end end
function S1wg_DG.overSome(...)local Jk6Nh=S1wg_DG.over(...)
return function(...)
return S1wg_DG.reduce(Jk6Nh(...),function(s1Ws,desLYv)return
s1Ws or desLYv end)end end
function S1wg_DG.overArgs(COq2NY9I,...)local aoBEg65S={...}
return
function(...)local x6={...}
for t3cNa2l=1,#aoBEg65S do local Ik=aoBEg65S[t3cNa2l]if
x6[t3cNa2l]then x6[t3cNa2l]=Ik(x6[t3cNa2l])end end;return COq2NY9I(hUL(x6))end end
function S1wg_DG.converge(SeHOs,P2rGsUx,c)return
function(...)return SeHOs(P2rGsUx(...),c(...))end end
function S1wg_DG.partial(v12AhMm,...)local F2uxGC={...}
return
function(...)local Xs0={...}local QK8ibF={}for TEio7k0z,u in kyWtqIf0(F2uxGC)do
QK8ibF[TEio7k0z]=(u==
'_')and S1wg_DG.shift(Xs0)or u end;return
v12AhMm(hUL(S1wg_DG.append(QK8ibF,Xs0)))end end
function S1wg_DG.partialRight(N,...)local O2YgxDc={...}
return
function(...)local VLsC67={...}local OHw4={}
for FKZ=1,#O2YgxDc do OHw4[FKZ]=(O2YgxDc[FKZ]==
'_')and S1wg_DG.shift(VLsC67)or
O2YgxDc[FKZ]end
return N(hUL(S1wg_DG.append(VLsC67,OHw4)))end end
function S1wg_DG.curry(Fl,QhS8FvKI)QhS8FvKI=QhS8FvKI or 2;local FaZIJL={}
local function sOT2O5(x)
if QhS8FvKI==1 then return Fl(x)end;if x~=nil then FaZIJL[#FaZIJL+1]=x end;if
#FaZIJL<QhS8FvKI then return sOT2O5 else local Wswd_OC={Fl(hUL(FaZIJL))}FaZIJL={}
return hUL(Wswd_OC)end end;return sOT2O5 end
function S1wg_DG.time(E,...)local A0Un=Mw()local nRHrI={E(...)}return Mw()-A0Un,hUL(nRHrI)end
function S1wg_DG.keys(k)local Zp={}for A in l(k)do Zp[#Zp+1]=A end;return Zp end;function S1wg_DG.values(_L_)local WHpm={}
for g,HiR3yiw in l(_L_)do WHpm[#WHpm+1]=HiR3yiw end;return WHpm end
function S1wg_DG.path(KeKbiDqN,...)
local WfrZqHH8,YX9s9O=KeKbiDqN,{...}for y64dF,sNSsH in kyWtqIf0(YX9s9O)do if(WfrZqHH8[sNSsH]==nil)then return end
WfrZqHH8=WfrZqHH8[sNSsH]end;return WfrZqHH8 end;function S1wg_DG.kvpairs(K)local o8T={}
for xeP,Tv_3VlmX in l(K)do o8T[#o8T+1]={xeP,Tv_3VlmX}end;return o8T end;function S1wg_DG.toObj(BT)
local _y3z={}
for rdl,NAP_5jYs in kyWtqIf0(BT)do _y3z[NAP_5jYs[1]]=NAP_5jYs[2]end;return _y3z end
function S1wg_DG.property(BZnlpW)return function(isN)return
isN[BZnlpW]end end;function S1wg_DG.propertyOf(yRADzw1v)
return function(Jafp)return yRADzw1v[Jafp]end end;function S1wg_DG.toBoolean(XWh8Ee)
return not not XWh8Ee end
function S1wg_DG.extend(kpezL1e,...)local h={...}for R7yfz_l9,D35PFLu in kyWtqIf0(h)do
if
v(D35PFLu)=='table'then for wK,qeEwE in l(D35PFLu)do kpezL1e[wK]=qeEwE end end end;return kpezL1e end
function S1wg_DG.functions(cbtvFnSa,fYKH_)cbtvFnSa=cbtvFnSa or S1wg_DG;local W={}for o,Mm99M in l(cbtvFnSa)do if
v(Mm99M)=='function'then W[#W+1]=o end end
if fYKH_ then
local l6YH=QFKEzBf(cbtvFnSa)
if l6YH and l6YH.__index then
local gf2=S1wg_DG.functions(l6YH.__index,fYKH_)for F744Ew,zgxKF4 in kyWtqIf0(gf2)do W[#W+1]=zgxKF4 end end end;return W end
function S1wg_DG.clone(UlvVvSBR,i2i)if v(UlvVvSBR)~='table'then return UlvVvSBR end
local uRGAL={}
for UUlqXyb6,fOR92g8 in l(UlvVvSBR)do if v(fOR92g8)=='table'then if not i2i then
uRGAL[UUlqXyb6]=S1wg_DG.clone(fOR92g8,i2i)else uRGAL[UUlqXyb6]=fOR92g8 end else
uRGAL[UUlqXyb6]=fOR92g8 end end;return uRGAL end
function S1wg_DG.tap(jU26,WIPTsAPz,...)WIPTsAPz(jU26,...)return jU26 end;function S1wg_DG.has(DgUx8,imac)return DgUx8[imac]~=nil end
function S1wg_DG.pick(xX,...)
local Mfb6Kb=S1wg_DG.flatten{...}local RRjV={}for TDOaFo,tLo4 in l(Mfb6Kb)do
if(xX[tLo4])~=nil then RRjV[tLo4]=xX[tLo4]end end;return RRjV end
function S1wg_DG.omit(m72l,...)local npM3DSU=S1wg_DG.flatten{...}local HGp4e1={}for uzJt7E,sRe5S32N in l(m72l)do
if not
S1wg_DG.include(npM3DSU,uzJt7E)then HGp4e1[uzJt7E]=sRe5S32N end end;return HGp4e1 end;function S1wg_DG.template(Bp,rg)if not rg then return Bp end
for S,Fem in l(rg)do if not Bp[S]then Bp[S]=Fem end end;return Bp end
function S1wg_DG.isEqual(cHmVGY,g29sXR,Vat)
local sfnkWAy8=v(cHmVGY)local hbJSGe9=v(g29sXR)if sfnkWAy8 ~=hbJSGe9 then return false end;if
sfnkWAy8 ~='table'then return(cHmVGY==g29sXR)end
local pI=QFKEzBf(cHmVGY)local B7jhm=QFKEzBf(g29sXR)
if Vat then if(pI or B7jhm)and
(pI.__eq or B7jhm.__eq)then
return
pI.__eq(cHmVGY,g29sXR)or B7jhm.__eq(g29sXR,cHmVGY)or(cHmVGY==g29sXR)end end
if S1wg_DG.size(cHmVGY)~=S1wg_DG.size(g29sXR)then return false end;local hj3
for FKxU4,UW in l(cHmVGY)do hj3=g29sXR[FKxU4]if hj3 ==nil or
not S1wg_DG.isEqual(UW,hj3,Vat)then return false end end
for tReY in l(g29sXR)do if cHmVGY[tReY]==nil then return false end end;return true end
function S1wg_DG.result(lex,h79Pm,...)
if lex[h79Pm]then if S1wg_DG.isCallable(lex[h79Pm])then return
lex[h79Pm](lex,...)else return lex[h79Pm]end end
if S1wg_DG.isCallable(h79Pm)then return h79Pm(lex,...)end end
function S1wg_DG.isTable(vksQpy4)return v(vksQpy4)=='table'end
function S1wg_DG.isCallable(gPCIWPt)return
(
(v(gPCIWPt)=='function')or(
(v(gPCIWPt)=='table')and QFKEzBf(gPCIWPt)and
QFKEzBf(gPCIWPt).__call~=nil)or false)end
function S1wg_DG.isArray(l4Byxa7)
if not(v(l4Byxa7)=='table')then return false end;local Fn8OR=0;for X1Z0van in l(l4Byxa7)do Fn8OR=Fn8OR+1
if l4Byxa7[Fn8OR]==nil then return false end end;return true end;function S1wg_DG.isIterable(C_ACFsd)
return S1wg_DG.toBoolean((l6Sm5(l,C_ACFsd)))end
function S1wg_DG.isEmpty(GC)
if(GC==nil)then return true end;if v(GC)=='string'then return#GC==0 end;if v(GC)=='table'then
return e(GC)==nil end;return true end
function S1wg_DG.isString(SC7gSvMB)return v(SC7gSvMB)=='string'end;function S1wg_DG.isFunction(Ei)return v(Ei)=='function'end;function S1wg_DG.isNil(GFuK1ut)return
GFuK1ut==nil end;function S1wg_DG.isNumber(SXmRY3i)return
v(SXmRY3i)=='number'end;function S1wg_DG.isNaN(b)return
v(b)=='number'and b~=b end;function S1wg_DG.isFinite(KApFr)if v(KApFr)~='number'then return
false end
return KApFr>-S9TO and KApFr<S9TO end;function S1wg_DG.isBoolean(jE)return v(jE)==
'boolean'end
function S1wg_DG.isInteger(yVVmXC)return
v(yVVmXC)=='number'and pS78Y(yVVmXC)==yVVmXC end
do S1wg_DG.forEach=S1wg_DG.each;S1wg_DG.forEachi=S1wg_DG.eachi
S1wg_DG.update=S1wg_DG.adjust;S1wg_DG.loop=S1wg_DG.cycle;S1wg_DG.collect=S1wg_DG.map
S1wg_DG.inject=S1wg_DG.reduce;S1wg_DG.foldl=S1wg_DG.reduce
S1wg_DG.injectr=S1wg_DG.reduceRight;S1wg_DG.foldr=S1wg_DG.reduceRight
S1wg_DG.mapr=S1wg_DG.mapReduce;S1wg_DG.maprr=S1wg_DG.mapReduceRight
S1wg_DG.any=S1wg_DG.include;S1wg_DG.some=S1wg_DG.include;S1wg_DG.contains=S1wg_DG.include
S1wg_DG.filter=S1wg_DG.select;S1wg_DG.discard=S1wg_DG.reject;S1wg_DG.every=S1wg_DG.all
S1wg_DG.takeWhile=S1wg_DG.selectWhile;S1wg_DG.rejectWhile=S1wg_DG.dropWhile;S1wg_DG.pop=S1wg_DG.shift
S1wg_DG.remove=S1wg_DG.pull;S1wg_DG.rmRange=S1wg_DG.removeRange
S1wg_DG.chop=S1wg_DG.removeRange;S1wg_DG.sub=S1wg_DG.slice;S1wg_DG.head=S1wg_DG.first
S1wg_DG.take=S1wg_DG.first;S1wg_DG.tail=S1wg_DG.rest;S1wg_DG.skip=S1wg_DG.last
S1wg_DG.without=S1wg_DG.difference;S1wg_DG.diff=S1wg_DG.difference
S1wg_DG.symdiff=S1wg_DG.symmetricDifference;S1wg_DG.xor=S1wg_DG.symmetricDifference
S1wg_DG.uniq=S1wg_DG.unique;S1wg_DG.isuniq=S1wg_DG.isunique;S1wg_DG.transpose=S1wg_DG.zip
S1wg_DG.part=S1wg_DG.partition;S1wg_DG.perm=S1wg_DG.permutation
S1wg_DG.transposeWith=S1wg_DG.zipWith;S1wg_DG.intersperse=S1wg_DG.interpose
S1wg_DG.sliding=S1wg_DG.aperture;S1wg_DG.mirror=S1wg_DG.invert;S1wg_DG.join=S1wg_DG.concat
S1wg_DG.average=S1wg_DG.mean;S1wg_DG.always=S1wg_DG.constant;S1wg_DG.cache=S1wg_DG.memoize
S1wg_DG.juxt=S1wg_DG.juxtapose;S1wg_DG.uid=S1wg_DG.uniqueid;S1wg_DG.iter=S1wg_DG.iterator
S1wg_DG.tabulate=S1wg_DG.array;S1wg_DG.nAry=S1wg_DG.ary;S1wg_DG.methods=S1wg_DG.functions
S1wg_DG.choose=S1wg_DG.pick;S1wg_DG.drop=S1wg_DG.omit;S1wg_DG.defaults=S1wg_DG.template
S1wg_DG.compare=S1wg_DG.isEqual;S1wg_DG.matches=S1wg_DG.isEqual end
do local MkxwoCeK={}local AT={}AT.__index=MkxwoCeK;local function _8KO(NI)
return oUA({_value=NI,_wrapped=true},AT)end
oUA(AT,{__call=function(PE,a)return _8KO(a)end,__index=function(GhVWeuQs,kQlY,...)return
MkxwoCeK[kQlY]end})function AT.chain(xIl1shq)return _8KO(xIl1shq)end
function AT:value()return self._value end;MkxwoCeK.chain,MkxwoCeK.value=AT.chain,AT.value
for qv,pbEt6T in l(S1wg_DG)do
if
qv~='operator'then
MkxwoCeK[qv]=function(MBdHQ,...)local STXAhhM=
v(MBdHQ)=='table'and PizLA9mj(MBdHQ,'_wrapped')or false;if STXAhhM then
local assFn=MBdHQ._value;local EXpWzv=pbEt6T(assFn,...)return _8KO(EXpWzv)else
return pbEt6T(MBdHQ,...)end end end end;MkxwoCeK.operator=S1wg_DG.operator
MkxwoCeK.op=S1wg_DG.operator
MkxwoCeK.import=function(kq,up)kq=kq or _ENV or _G
local wlI_l=S1wg_DG.functions()for nK7J,xv in kyWtqIf0(wlI_l)do
if PizLA9mj(kq,xv)~=nil then if not up then
rawset(kq,xv,S1wg_DG[xv])end else rawset(kq,xv,S1wg_DG[xv])end end
return kq end;AT._VERSION='Moses v'..SWFtRywD
AT._URL='http://github.com/Yonaba/Moses'
AT._LICENSE='MIT <http://raw.githubusercontent.com/Yonaba/Moses/master/LICENSE>'AT._DESCRIPTION='utility-belt library for functional programming in Lua'
return AT end