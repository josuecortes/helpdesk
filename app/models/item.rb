class Item < ActiveRecord::Base

	validates_presence_of :nome
	validates_uniqueness_of :nome

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.nome = ActiveSupport::Inflector.transliterate(self.nome).upcase if !self.nome.blank?  
		
	end
end
