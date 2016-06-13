class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :departamento_nome

  belongs_to :departamento
  has_many :chamados
  has_many :responsavel, inverse_of: :tecnico, :class_name=>"Chamado"
  has_and_belongs_to_many :roles


  validates_presence_of :name
	validates_uniqueness_of :name
  validates_presence_of :departamento_id, :if => :nao_admin
  validates_presence_of :departamento_nome, :if => :checar_departamento_id


  def pode_criar_chamado
    if self.chamados.count > 0
      c = self.chamados.last
      if c.status == "FECHADO" or c.status == "CANCELADO"
        return true
      else
        return false
      end
    else 
      return true
    end
  end

  def e_tecnico
    r = Role.where(:nome=>"TECNICO").first
    if self.roles.include?r
      return true
    else
      return false
    end 
  end

  def nao_admin
    r = Role.where(:nome=>"ADMINISTRADOR").first
    if self.roles.include?r
      return false
    else
      return true
    end 
  end

  def nao_admin_nao_tecnico
    r1 = Role.where(:nome=>"ADMINISTRADOR").first
    r2 = Role.where(:nome=>"TECNICO").first
    if (self.roles.include?r1 or self.roles.include?r2) 
      return true
    else
      return false
    end
  end

  def checar_departamento_id
    if self.departamento_id.blank?
      return true
    else
      return false
    end 
  end




	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.name = ActiveSupport::Inflector.transliterate(self.name).upcase if !self.name.blank?  
		
	end
end
