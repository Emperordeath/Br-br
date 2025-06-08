local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "🍽️ Death Hub - Modo Insano 1s",
   LoadingTitle = "Área atualizando a cada segundo...",
   LoadingSubtitle = "Fome sem limites!",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "DeathHub",
      FileName = "CamaleaoFome1s"
   },
   KeySystem = false,
})

local MainTab = Window:CreateTab("⚙️ Comer Mutante", 4483362458)
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local EatRangePart = Character:WaitForChild("攻击范围"):WaitForChild("Eat")

local minTamanho = 1000
local maxTamanho = 10000
local ativado = false

MainTab:CreateParagraph({
   Title = "Mudança de Área a Cada 1 Segundo",
   Content = "Coma tudo com estilo e velocidade."
})

MainTab:CreateToggle({
   Name = "⚡ Ativar Comer Aleatório (1s)",
   CurrentValue = false,
   Callback = function(state)
      ativado = state
      if state then
         Rayfield:Notify({
            Title = "Modo 1s Ativado",
            Content = "Tamanho da área sendo trocado toda hora!",
            Duration = 4,
         })

         task.spawn(function()
            while ativado do
               local novoValor = math.random(minTamanho, maxTamanho)
               EatRangePart.Size = Vector3.new(novoValor, novoValor, novoValor)
               wait(1) -- ⚠️ ALTERADO PARA 1 SEGUNDO
            end
         end)
      else
         Rayfield:Notify({
            Title = "Modo Desligado",
            Content = "Seu estômago tá de férias.",
            Duration = 4,
         })
      end
   end
})
