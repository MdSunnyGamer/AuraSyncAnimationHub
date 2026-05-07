-- // AuraSync Animation Hub v10 (Platoboost Release Build) // --
-- // Developer: MdSaniYT_507 //
-- // Security: Platoboost HWID Authentication //

-- ========================================================
-- // PLATOBOOST API ENGINE (DO NOT MODIFY) //
-- ========================================================
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;local lEncode, lDecode, lDigest = a3, aw, Z;

local service = 24980;  
local secret = "b003a800-9a7a-4754-81e9-ea84b48e45ca"; 
local useNonce = true;  

local onMessage = function(message) end;
repeat task.wait(1) until game:IsLoaded();

local requestSending = false;
local fSetClipboard, fRequest, fStringChar, fToString, fStringSub, fOsTime, fMathRandom, fMathFloor, fGetHwid = setclipboard or toclipboard, request or http_request or syn_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function() return game:GetService("Players").LocalPlayer.UserId end
local cachedLink, cachedTime = "", 0;

local host = "https://api.platoboost.com";
local hostResponse = fRequest({Url = host .. "/public/connectivity", Method = "GET"});
if hostResponse.StatusCode ~= 200 or hostResponse.StatusCode ~= 429 then
    host = "https://api.platoboost.net";
end

function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response = fRequest({
            Url = host .. "/public/start", Method = "POST",
            Body = lEncode({service = service, identifier = lDigest(fGetHwid())}),
            Headers = {["Content-Type"] = "application/json"}
        });
        if response.StatusCode == 200 then
            local decoded = lDecode(response.Body);
            if decoded.success == true then
                cachedLink = decoded.data.url; cachedTime = fOsTime(); return true, cachedLink;
            else onMessage(decoded.message); return false, decoded.message; end
        elseif response.StatusCode == 429 then
            local msg = "you are being rate limited, please wait 20 seconds and try again.";
            onMessage(msg); return false, msg;
        end
        local msg = "Failed to cache link."; onMessage(msg); return false, msg;
    else return true, cachedLink; end
end
cacheLink();

local generateNonce = function()
    local str = ""
    for _ = 1, 16 do str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return str
end

for _ = 1, 5 do
    local oNonce = generateNonce(); task.wait(0.2)
    if generateNonce() == oNonce then local msg = "platoboost nonce error."; onMessage(msg); error(msg); end
end

local copyLink = function()
    local success, link = cacheLink();
    if success then fSetClipboard(link); end
end

local redeemKey = function(key)
    local nonce = generateNonce();
    local endpoint = host .. "/public/redeem/" .. fToString(service);
    local body = {identifier = lDigest(fGetHwid()), key = key}
    if useNonce then body.nonce = nonce; end
    local response = fRequest({Url = endpoint, Method = "POST", Body = lEncode(body), Headers = {["Content-Type"] = "application/json"}});

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);
        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then return true;
                    else onMessage("failed to verify integrity."); return false; end    
                else return true; end
            else onMessage("key is invalid."); return false; end
        else
            if fStringSub(decoded.message, 1, 27) == "unique constraint violation" then
                onMessage("you already have an active key, please wait for it to expire before redeeming it."); return false;
            else onMessage(decoded.message); return false; end
        end
    elseif response.StatusCode == 429 then onMessage("you are being rate limited, please wait 20 seconds and try again."); return false;
    else onMessage("server returned an invalid status code, please try again later."); return false; end
end

local verifyKey = function(key)
    if requestSending == true then onMessage("a request is already being sent, please slow down."); return false; else requestSending = true; end
    local nonce = generateNonce();
    local endpoint = host .. "/public/whitelist/" .. fToString(service) .. "?identifier=" .. lDigest(fGetHwid()) .. "&key=" .. key;
    if useNonce then endpoint = endpoint .. "&nonce=" .. nonce; end
    local response = fRequest({Url = endpoint, Method = "GET"});
    requestSending = false;

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);
        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then return true;
                    else onMessage("failed to verify integrity."); return false; end
                else return true; end
            else
                if fStringSub(key, 1, 4) == "KEY_" then return redeemKey(key); else onMessage("key is invalid."); return false; end
            end
        else onMessage(decoded.message); return false; end
    elseif response.StatusCode == 429 then onMessage("you are being rate limited, please wait 20 seconds and try again."); return false;
    else onMessage("server returned an invalid status code, please try again later."); return false; end
end

-- ========================================================
-- // PLATOBOOST UI AUTHENTICATION WRAPPER //
-- ========================================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

onMessage = function(message)
    Rayfield:Notify({
        Title = "Platoboost System",
        Content = message,
        Duration = 4
    })
end

local keyFileName = "AuraSync_PBKey.txt"
local savedKey = ""
if isfile and isfile(keyFileName) then
    savedKey = readfile(keyFileName)
end

function LoadMainHub()
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local Workspace = game:GetService("Workspace")
    local RunService = game:GetService("RunService")
    local player = Players.LocalPlayer

    local originalAnims = {}
    local function BackupDefaults(character)
        local animate = character:WaitForChild("Animate", 5)
        if animate then
            for _, folder in ipairs(animate:GetChildren()) do
                if folder:IsA("StringValue") or folder:IsA("Folder") then
                    for _, anim in ipairs(folder:GetChildren()) do
                        if anim:IsA("Animation") then originalAnims[folder.Name] = anim.AnimationId end
                    end
                end
            end
        end
    end
    if player.Character then BackupDefaults(player.Character) end

    local AnimationDatabase = {
        ["Ninja"] = {idle = {"rbxassetid://10921155160", "rbxassetid://10921155867", "rbxassetid://10921156883"}, walk = "rbxassetid://10921162768", run = "rbxassetid://10921157929", jump = "rbxassetid://10921160088", fall = "rbxassetid://10921159222", climb = "rbxassetid://10921154678", swim = "rbxassetid://10921161002", swimIdle = "rbxassetid://10922757002"},
        ["Vampire"] = {idle = {"rbxassetid://10921315373", "rbxassetid://10921316709", "rbxassetid://10921317792"}, walk = "rbxassetid://10921326949", run = "rbxassetid://10921320299", jump = "rbxassetid://10921322186", fall = "rbxassetid://10921321317", climb = "rbxassetid://10921314188", swim = "rbxassetid://10921324408", swimIdle = "rbxassetid://10921325443"},
        ["Mage"] = {idle = {"rbxassetid://10921144709", "rbxassetid://10921145797", "rbxassetid://10921146941"}, walk = "rbxassetid://10921152678", run = "rbxassetid://10921148209", jump = "rbxassetid://10921149743", fall = "rbxassetid://10921148939", climb = "rbxassetid://10921143404", swim = "rbxassetid://10921150788", swimIdle = "rbxassetid://10921151661"},
        ["Zombie"] = {idle = {"rbxassetid://10921344533", "rbxassetid://10921345304", "rbxassetid://10921347258"}, walk = "rbxassetid://10921355261", run = "rbxassetid://616163682", jump = "rbxassetid://10921351278", fall = "rbxassetid://10921350320", climb = "rbxassetid://10921343576", swim = "rbxassetid://10921352344", swimIdle = "rbxassetid://10921353442"},
        ["Superhero"] = {idle = {"rbxassetid://10921288909", "rbxassetid://10921290167", "rbxassetid://10921290942"}, walk = "rbxassetid://10921298616", run = "rbxassetid://10921291831", jump = "rbxassetid://10921294559", fall = "rbxassetid://10921293373", climb = "rbxassetid://10921286911", swim = "rbxassetid://10921295495", swimIdle = "rbxassetid://10921297391"},
        ["Levitation"] = {idle = {"rbxassetid://10921132962", "rbxassetid://10921133721", "rbxassetid://10921134514"}, walk = "rbxassetid://10921140719", run = "rbxassetid://10921135644", jump = "rbxassetid://10921137402", fall = "rbxassetid://10921136539", climb = "rbxassetid://10921132092", swim = "rbxassetid://10921138209", swimIdle = "rbxassetid://10921139478"},
        ["Adidas Sports"] = {idle = {"rbxassetid://18537376492", "rbxassetid://18537371272", "rbxassetid://18537374150"}, walk = "rbxassetid://18537392113", run = "rbxassetid://18537384940", jump = "rbxassetid://18537380791", fall = "rbxassetid://18537367238", climb = "rbxassetid://18537363391", swim = "rbxassetid://18537389531", swimIdle = "rbxassetid://18537387180"},
        ["Adidas Community"] = {idle = {"rbxassetid://122257458498464", "rbxassetid://102357151005774", "rbxassetid://89262795687364"}, walk = "rbxassetid://122150855457006", run = "rbxassetid://82598234841035", jump = "rbxassetid://75290611992385", fall = "rbxassetid://98600215928904", climb = "rbxassetid://88763136693023", swim = "rbxassetid://133308483266208", swimIdle = "rbxassetid://109346520324160"},
        ["Adidas Aura"] = {idle = {"rbxassetid://110211186840347", "rbxassetid://114191137265065", "rbxassetid://99129837931148"}, walk = "rbxassetid://83842218823011", run = "rbxassetid://118320322718866", jump = "rbxassetid://109996626521204", fall = "rbxassetid://95603166884636", climb = "rbxassetid://97824616490448", swim = "rbxassetid://134530128383903", swimIdle = "rbxassetid://94922130551805"},
        ["Toy"] = {idle = {"rbxassetid://10921301576", "rbxassetid://10921302207", "rbxassetid://10921303913"}, walk = "rbxassetid://10921312010", run = "rbxassetid://10921306285", jump = "rbxassetid://10921308158", fall = "rbxassetid://10921307241", climb = "rbxassetid://10921300839", swim = "rbxassetid://10921309319", swimIdle = "rbxassetid://10921310341"},
        ["Old School"] = {idle = {"rbxassetid://10921230744", "rbxassetid://10921232093", "rbxassetid://10921233298"}, walk = "rbxassetid://10921244891", run = "rbxassetid://10921240218", jump = "rbxassetid://10921242013", fall = "rbxassetid://10921241244", climb = "rbxassetid://10921229866", swim = "rbxassetid://10921243048", swimIdle = "rbxassetid://10921244018"},
        ["Robot"] = {idle = {"rbxassetid://10921248039", "rbxassetid://10921248831", "rbxassetid://10921249579"}, walk = "rbxassetid://10921255446", run = "rbxassetid://10921250460", jump = "rbxassetid://10921252123", fall = "rbxassetid://10921251156", climb = "rbxassetid://10921247141", swim = "rbxassetid://10921253142", swimIdle = "rbxassetid://10921253767"},
        ["Cartoony"] = {idle = {"rbxassetid://10921071918", "rbxassetid://10921072875", "rbxassetid://10921074502"}, walk = "rbxassetid://10921082452", run = "rbxassetid://10921076136", jump = "rbxassetid://10921078135", fall = "rbxassetid://10921077030", climb = "rbxassetid://10921070953", swim = "rbxassetid://10921079380", swimIdle = "rbxassetid://10921081059"},
        ["Stylish"] = {idle = {"rbxassetid://10921272275", "rbxassetid://10921273958", "rbxassetid://10921275151"}, walk = "rbxassetid://10921283326", run = "rbxassetid://10921276116", jump = "rbxassetid://10921279832", fall = "rbxassetid://10921278648", climb = "rbxassetid://10921271391", swim = "rbxassetid://10921281000", swimIdle = "rbxassetid://10921281964"},
        ["Wicked Popular"] = {idle = {"rbxassetid://118832222982049", "rbxassetid://76049494037641", "rbxassetid://138255200176080"}, walk = "rbxassetid://92072849924640", run = "rbxassetid://72301599441680", jump = "rbxassetid://104325245285198", fall = "rbxassetid://121152442762481", climb = "rbxassetid://131326830509784", swim = "rbxassetid://99384245425157", swimIdle = "rbxassetid://113199415118199"},
        ["Bold"] = {idle = {"rbxassetid://16738333868", "rbxassetid://16738334710", "rbxassetid://16738335517"}, walk = "rbxassetid://16738340646", run = "rbxassetid://16738337225", jump = "rbxassetid://16738336650", fall = "rbxassetid://16738333171", climb = "rbxassetid://16738332169", swim = "rbxassetid://16738339158", swimIdle = "rbxassetid://16738339817"},
        ["Catwalk Glam"] = {idle = {"rbxassetid://133806214992291", "rbxassetid://94970088341563", "rbxassetid://87105332133518"}, walk = "rbxassetid://109168724482748", run = "rbxassetid://81024476153754", jump = "rbxassetid://116936326516985", fall = "rbxassetid://92294537340807", climb = "rbxassetid://119377220967554", swim = "rbxassetid://134591743181628", swimIdle = "rbxassetid://98854111361360"}
    }
    local bundleNamesList = {}
    for name, _ in pairs(AnimationDatabase) do table.insert(bundleNamesList, name) end
    table.sort(bundleNamesList)

    local activeInjectedAnims = nil 

    local function InjectAnimationTable(bundleTable)
        local targetChar = player.Character
        if not targetChar then return end
        local animate = targetChar:FindFirstChild("Animate")
        local humanoid = targetChar:FindFirstChild("Humanoid")
        if not animate or not humanoid then return end
        for stateName, idData in pairs(bundleTable) do
            if idData then
                local folder = animate:FindFirstChild(stateName)
                if folder then
                    for _, obj in ipairs(folder:GetChildren()) do if obj:IsA("Animation") then obj:Destroy() end end
                    if type(idData) == "table" then
                        for i, id in ipairs(idData) do
                            local newAnim = Instance.new("Animation")
                            newAnim.Name = "Animation" .. i
                            newAnim.AnimationId = id
                            local weight = Instance.new("NumberValue", newAnim)
                            weight.Name = "Weight"; weight.Value = (i == 1) and 9 or 1 
                            newAnim.Parent = folder 
                        end
                    else
                        local newAnim = Instance.new("Animation")
                        newAnim.Name = stateName:gsub("^%l", string.upper) .. "Anim" 
                        newAnim.AnimationId = idData
                        local weight = Instance.new("NumberValue", newAnim)
                        weight.Name = "Weight"; weight.Value = 10
                        newAnim.Parent = folder 
                    end
                end
            end
        end
        for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do track:Stop() end
    end

    player.CharacterAdded:Connect(function(newChar)
        if activeInjectedAnims then task.wait(1); InjectAnimationTable(activeInjectedAnims) end
    end)

    local MainWindow = Rayfield:CreateWindow({
       Name = "AuraSync Animation Hub | By: MdSaniYT_507",
       LoadingTitle = "Platoboost Authentication Successful",
       LoadingSubtitle = "by MdSaniYT_507",
       ConfigurationSaving = {Enabled = false},
       KeySystem = false
    })

    local MovementTab = MainWindow:CreateTab("Movement", 4483345998) 
    MovementTab:CreateSlider({Name = "WalkSpeed Override", Range = {16, 1000}, Increment = 1, Suffix = "Studs", CurrentValue = 16, Flag = "SpeedSlider", Callback = function(Value) if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.WalkSpeed = Value end end})
    MovementTab:CreateSlider({Name = "JumpPower Override", Range = {50, 1000}, Increment = 1, Suffix = "Power", CurrentValue = 50, Flag = "JumpSlider", Callback = function(Value) if player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.UseJumpPower = true; player.Character.Humanoid.JumpPower = Value end end})
    local infJumpEnabled = false
    MovementTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Flag = "InfJumpToggle", Callback = function(Value) infJumpEnabled = Value end})
    UserInputService.JumpRequest:Connect(function() if infJumpEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end)

    local BundleTab = MainWindow:CreateTab("Bundles", 4483362458) 
    BundleTab:CreateButton({Name = "🔁 RESET ANIMATIONS TO DEFAULT", Callback = function() activeInjectedAnims = nil; InjectAnimationTable(originalAnims); Rayfield:Notify({Title = "Restored", Content = "Your default Roblox animations have been restored.", Duration = 3}) end})
    BundleTab:CreateDropdown({Name = "Select Master Bundle", Options = bundleNamesList, CurrentOption = {""}, MultipleOptions = false, Flag = "MasterAnimDropdown", Callback = function(Option) local selectedBundle = Option[1]; if AnimationDatabase[selectedBundle] then activeInjectedAnims = AnimationDatabase[selectedBundle]; InjectAnimationTable(activeInjectedAnims); Rayfield:Notify({Title = "Bundle Applied", Content = selectedBundle .. " successfully injected.", Duration = 3}) end end})

    local CustomTab = MainWindow:CreateTab("Custom Mix", 4483362458)
    CustomTab:CreateButton({Name = "🔁 RESET ANIMATIONS TO DEFAULT", Callback = function() activeInjectedAnims = nil; InjectAnimationTable(originalAnims); Rayfield:Notify({Title = "Restored", Content = "Default animations restored.", Duration = 3}) end})
    local currentCustomMix = {}
    local statesToMap = {"idle", "walk", "run", "jump", "fall", "climb", "swim"}
    for _, state in ipairs(statesToMap) do CustomTab:CreateDropdown({Name = "Select " .. string.upper(state), Options = bundleNamesList, CurrentOption = {""}, MultipleOptions = false, Flag = "CustomDrop_" .. state, Callback = function(Option) local selectedBundle = Option[1]; if AnimationDatabase[selectedBundle] then currentCustomMix[state] = AnimationDatabase[selectedBundle][state]; if state == "swim" then currentCustomMix["swimIdle"] = AnimationDatabase[selectedBundle]["swimIdle"] end end end}) end
    CustomTab:CreateButton({Name = "⚡ INJECT CUSTOM MIX", Callback = function() local mixToApply = {}; for k, v in pairs(currentCustomMix) do mixToApply[k] = v end; activeInjectedAnims = mixToApply; InjectAnimationTable(activeInjectedAnims); Rayfield:Notify({Title = "Success", Content = "Custom Mix Applied & Saved!", Duration = 3}) end})

    local FunTab = MainWindow:CreateTab("Fun Exploits", 4483345998)
    local flying = false; local flySpeed = 50
    FunTab:CreateToggle({Name = "Toggle Fly", CurrentValue = false, Flag = "FlyToggle", Callback = function(Value) flying = Value; local char = player.Character; if not char or not char:FindFirstChild("HumanoidRootPart") then return end; if flying then local bv = Instance.new("BodyVelocity", char.HumanoidRootPart); bv.Name = "HubFlyVel"; bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge); bv.Velocity = Vector3.new(0, 0, 0); local bg = Instance.new("BodyGyro", char.HumanoidRootPart); bg.Name = "HubFlyGyro"; bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9); bg.P = 9e4; bg.CFrame = char.HumanoidRootPart.CFrame; task.spawn(function() while flying and char and char:FindFirstChild("HumanoidRootPart") do local camera = Workspace.CurrentCamera; local moveDir = char.Humanoid.MoveDirection; bv.Velocity = moveDir * flySpeed; if UserInputService:IsKeyDown(Enum.KeyCode.Space) then bv.Velocity = bv.Velocity + Vector3.new(0, flySpeed, 0) elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then bv.Velocity = bv.Velocity - Vector3.new(0, flySpeed, 0) end; bg.CFrame = CFrame.new(char.HumanoidRootPart.Position, char.HumanoidRootPart.Position + camera.CFrame.LookVector); RunService.RenderStepped:Wait() end end) else if char.HumanoidRootPart:FindFirstChild("HubFlyVel") then char.HumanoidRootPart.HubFlyVel:Destroy() end; if char.HumanoidRootPart:FindFirstChild("HubFlyGyro") then char.HumanoidRootPart.HubFlyGyro:Destroy() end end end})
    FunTab:CreateSlider({Name = "Fly Speed", Range = {10, 200}, Increment = 1, Suffix = "Speed", CurrentValue = 50, Flag = "FlySpeed", Callback = function(Value) flySpeed = Value end})
    local noclip = false; FunTab:CreateToggle({Name = "Toggle Noclip", CurrentValue = false, Flag = "NoclipToggle", Callback = function(Value) noclip = Value end}); RunService.Stepped:Connect(function() if noclip and player.Character then for _, part in pairs(player.Character:GetDescendants()) do if part:IsA("BasePart") and part.CanCollide then part.CanCollide = false end end end end)
    local espEnabled = false; FunTab:CreateToggle({Name = "Player ESP (Wallhack)", CurrentValue = false, Flag = "ESPToggle", Callback = function(Value) espEnabled = Value; if espEnabled then for _, p in pairs(Players:GetPlayers()) do if p ~= player and p.Character then local highlight = Instance.new("Highlight"); highlight.Name = "HubESP"; highlight.FillColor = Color3.fromRGB(0, 255, 170); highlight.Parent = p.Character end end else for _, p in pairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("HubESP") then p.Character.HubESP:Destroy() end end end end}); Players.PlayerAdded:Connect(function(p) p.CharacterAdded:Connect(function(c) if espEnabled then task.wait(1); local highlight = Instance.new("Highlight"); highlight.Name = "HubESP"; highlight.FillColor = Color3.fromRGB(0, 255, 170); highlight.Parent = c end end) end)
    local isInvisible = false; FunTab:CreateToggle({Name = "Local Invisibility (Ghost Mode)", CurrentValue = false, Flag = "InvisToggle", Callback = function(Value) isInvisible = Value; local char = player.Character; if char then for _, part in pairs(char:GetDescendants()) do if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then part.Transparency = isInvisible and 1 or 0 elseif part:IsA("Decal") then part.Transparency = isInvisible and 1 or 0 end end; if char:FindFirstChild("Humanoid") then char.Humanoid.DisplayDistanceType = isInvisible and Enum.HumanoidDisplayDistanceType.None or Enum.HumanoidDisplayDistanceType.Viewer end end end})
    FunTab:CreateButton({Name = "Give BTools (Building Tools)", Callback = function() for i = 1, 3 do local tool = Instance.new("HopperBin"); tool.BinType = i; tool.Parent = player.Backpack end; Rayfield:Notify({Title = "Success", Content = "BTools added to inventory.", Duration = 3}) end})
    FunTab:CreateButton({Name = "Get Quantum Teleporter (Click to TP)", Callback = function() local tpTool = Instance.new("Tool"); tpTool.Name = "Quantum Teleporter"; tpTool.RequiresHandle = false; tpTool.ToolTip = "Click anywhere to teleport!"; tpTool.Parent = player.Backpack; tpTool.Activated:Connect(function() local mouse = player:GetMouse(); local charRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart"); if charRoot and mouse.Hit then charRoot.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0)) end end) end})

    local AdminTab = MainWindow:CreateTab("Admin Scripts", 4483362458)
    AdminTab:CreateButton({Name = "Execute Infinite Yield (Latest)", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))(); Rayfield:Notify({Title = "Executed", Content = "Infinite Yield has been injected.", Duration = 3}) end})
    AdminTab:CreateButton({Name = "Execute Nameless Admin", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))(); Rayfield:Notify({Title = "Executed", Content = "Nameless Admin has been injected.", Duration = 3}) end})
    AdminTab:CreateButton({Name = "Execute CMD-X", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))(); Rayfield:Notify({Title = "Executed", Content = "CMD-X has been injected.", Duration = 3}) end})
    AdminTab:CreateButton({Name = "Execute Fates Admin", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))(); Rayfield:Notify({Title = "Executed", Content = "Fates Admin has been injected.", Duration = 3}) end})

    local InfoTab = MainWindow:CreateTab("Info", 4483362458)
    InfoTab:CreateLabel("Script by MdSaniYT_507")
    InfoTab:CreateParagraph({Title = "About AuraSync Hub", Content = "Engineered entirely by MdSaniYT_507.\n\nSecured by Platoboost HWID Authentication."})
end

-- ========================================================
-- // PLATOBOOST AUTHENTICATION UI & AUTO-VERIFY //
-- ========================================================
if savedKey ~= "" and verifyKey(savedKey) then
    LoadMainHub()
else
    local AuthWindow = Rayfield:CreateWindow({
        Name = "AuraSync Hub | Authentication",
        LoadingTitle = "Platoboost Key System",
        LoadingSubtitle = "by MdSaniYT_507",
        ConfigurationSaving = {Enabled = false},
        KeySystem = false
    })

    local KeyTab = AuthWindow:CreateTab("Key Verification", 4483362458)

    KeyTab:CreateButton({
        Name = "Step 1: Get Key (Copies Link to Clipboard)",
        Callback = function()
            copyLink()
            Rayfield:Notify({
                Title = "Link Copied!",
                Content = "Paste the link in your browser to complete the steps.",
                Duration = 5
            })
        end,
    })

    local enteredKey = ""
    KeyTab:CreateInput({
        Name = "Step 2: Enter Key",
        PlaceholderText = "Paste your Platoboost key here...",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)
            enteredKey = Text
        end,
    })

    KeyTab:CreateButton({
        Name = "Step 3: Verify Access",
        Callback = function()
            if enteredKey == "" then
                onMessage("Please enter a key first.")
                return
            end
            
            Rayfield:Notify({Title = "Verifying...", Content = "Checking key with Platoboost servers...", Duration = 2})
            
            if verifyKey(enteredKey) then
                if writefile then writefile(keyFileName, enteredKey) end
                Rayfield:Notify({Title = "Success!", Content = "Key Verified. Loading AuraSync...", Duration = 3})
                Rayfield:Destroy()
                task.wait(1)
                LoadMainHub()
            end
        end,
    })
end
