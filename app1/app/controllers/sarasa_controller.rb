class SarasaController < ApplicationController
	def index
		@especial = params[:name].upcase
		@names = ["Giselle", "Ariel", "Franco", "Lucia"]
	end
end