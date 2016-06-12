r = Role.find_or_create_by(:nome=>"ADMINISTRADOR")
if r.save
	puts "Role ADMINISTRADOR criada"
else
	puts "Erro ao criar a role ADMINISTRADOR"
end

d = Departamento.find_or_create_by(:nome=>"NUCLEO DE INFORMATICA", :sigla=>"NUINFO")
if d.save
	puts "Departamento NUINFO criadO"
else
	puts "Erro ao criar departamento NUINFO"
end

u = User.new
u.name="ADMINISTRADOR DO SISTEMA"
u.email="administrador@helpdesk.com"
u.password="12345678"
u.password_confirmation="12345678"
u.mudar_senha = false
u.ativo = true
u.departamento = d
u.roles << r

if u.save
	puts "Usuario Administrador Criado"
else
	puts "Erro ao Criar Usuario Administrador"
end

Role.find_or_create_by(:nome=>"TECNICO")
Role.find_or_create_by(:nome=>"REQUISITANTE")


