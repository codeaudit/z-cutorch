function torch.ZCudaTensor.apply(self, func)
   local x = torch.ZFloatTensor(self:size()):copy(self)
   x:apply(func)
   self:copy(x)
   return self
end

local function Tensor__type(self,type)
   local current = torch.typename(self)
   if not type then return current end
   if type ~= current then
      local new = torch.getmetatable(type).new()
      if self:nElement() > 0 then
         new:resize(self:size()):copy(self)
      end
      return new
   else
      return self
   end
end
local function Tensor__typeAs(self,tensor)
   return self:type(tensor:type())
end
local function Tensor__zcuda(self)
   return self:type('torch.ZCudaTensor')
end
local function Tensor__double(self)
   return self:type('torch.DoubleTensor')
end
local function Tensor__zfloat(self)
   return self:type('torch.ZFloatTensor')
end

local function Tensor__byte(self)
   return self:type('torch.ByteTensor')
end

local function Tensor__char(self)
   return self:type('torch.CharTensor')
end

local function Tensor__int(self)
   return self:type('torch.IntTensor')
end

local function Tensor__short(self)
   return self:type('torch.ShortTensor')
end

local function Tensor__long(self)
   return self:type('torch.LongTensor')
end

rawset(torch.getmetatable('torch.DoubleTensor'), 'cuda', Tensor__zcuda)
rawset(torch.getmetatable('torch.FloatTensor'), 'cuda', Tensor__zcuda)
rawset(torch.getmetatable('torch.ByteTensor'), 'cuda', Tensor__zcuda)
rawset(torch.getmetatable('torch.CharTensor'), 'cuda', Tensor__zcuda)
rawset(torch.getmetatable('torch.IntTensor'), 'cuda', Tensor__zcuda)
rawset(torch.getmetatable('torch.ShortTensor'), 'cuda', Tensor__zcuda)
rawset(torch.getmetatable('torch.LongTensor'), 'cuda', Tensor__zcuda)
rawset(torch.getmetatable('torch.CudaTensor'), 'cuda', Tensor__zcuda)

rawset(torch.getmetatable('torch.ZCudaTensor'), 'type', Tensor__type)
rawset(torch.getmetatable('torch.ZCudaTensor'), 'typeAs', Tensor__typeAs)
rawset(torch.getmetatable('torch.ZCudaTensor'), 'zfloat', Tensor__zfloat)

do
    local metatable = torch.getmetatable('torch.ZCudaTensor')
    for _,func in pairs{'expand', 'expandAs', 'view', 'viewAs', 'repeatTensor',
                        'permute', 'split', 'chunk'} do
        rawset(metatable, func, torch[func])
    end
end
