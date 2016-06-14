class Incidente < ActiveRecord::Base

	attr_accessor :tipo_incidente_descricao

	belongs_to :tipo_incidente

	validates_presence_of :descricao, :data_inicio, :status, :tipo_incidente_id
	validates_uniqueness_of :descricao
	validates_presence_of :data_fim, :if => :checar_status

  validates_presence_of :tipo_incidente_descricao, :if => :checar_tipo_incidente_id

	before_save :maiusculas_sem_acentos

	def checar_tipo_incidente_id
    if self.tipo_incidente_id.blank?
      return true
    else
      return false
    end 
  end

  def checar_status
    if self.status == "FINALIZADO"
      return true
    else
      return false
    end 
  end

	def maiusculas_sem_acentos

		self.descricao = ActiveSupport::Inflector.transliterate(self.descricao).upcase if !self.descricao.blank?  
		self.observacoes = ActiveSupport::Inflector.transliterate(self.observacoes).upcase if !self.observacoes.blank?  

	end
end
