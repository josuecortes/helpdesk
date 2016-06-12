class Departamento < ActiveRecord::Base

	has_many :users

	validates_presence_of :nome, :sigla
	validates_uniqueness_of :nome, :sigla

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.nome = ActiveSupport::Inflector.transliterate(self.nome).upcase if !self.nome.blank?  
		self.sigla = ActiveSupport::Inflector.transliterate(self.sigla).upcase if !self.sigla.blank?  

	end
end
