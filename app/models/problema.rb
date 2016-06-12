class Problema < ActiveRecord::Base

	has_many :chamados

	validates_presence_of :descricao, :tipo
	validates_uniqueness_of :descricao

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.descricao = ActiveSupport::Inflector.transliterate(self.descricao).upcase if !self.descricao.blank?  
		self.solucao = ActiveSupport::Inflector.transliterate(self.solucao).upcase if !self.solucao.blank?  

	end

end

