class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :departamento
  has_many :chamados
  has_many :responsavel, inverse_of: :tecnico, :class_name=>"Chamado"
  has_and_belongs_to_many :roles


  validates_presence_of :name
	validates_uniqueness_of :name


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


	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.name = ActiveSupport::Inflector.transliterate(self.name).upcase if !self.name.blank?  
		
	end
end
