class Incidente < ActiveRecord::Base
	belongs_to :tipo_incidente

	validates_presence_of :descricao, :data_inicio, :status
	validates_uniqueness_of :descricao

	before_save :maiusculas_sem_acentos

	def maiusculas_sem_acentos

		self.descricao = ActiveSupport::Inflector.transliterate(self.descricao).upcase if !self.descricao.blank?  
		self.observacoes = ActiveSupport::Inflector.transliterate(self.observacoes).upcase if !self.observacoes.blank?  

	end
end
