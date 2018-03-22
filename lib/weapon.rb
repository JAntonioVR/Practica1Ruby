
#@author Pedro Pablo Ruiz Huertas y Juan Antonio Villegas Recio

#encoding:utf-8

require_relative "WeaponType"

module Deepspace
  class Weapon
    
    attr_reader :type, :uses
    
    def initialize(new_name, new_type, new_uses)
      @name = new_name
      @type = new_type
      @uses = new_uses
    end
   
    def newCopy(s)
      @name = s.name
      @type = s.type
      @uses = s.uses
    end
    
    def getUIversion
      return WeaponToUI.new(self)
    end
    
    def power()
      return @type.power
    end
    
    def useIt()
     if @uses > 0
       @uses = @uses - 1
       return @type.power
     else
       return 1.0
     end
    end
    
    def to_s
      cad= "Nombre: #{@name}, Usos: #{@uses}"
      if(@type==WeaponType::MISSILE)
        cad=cad+", Tipo: MISSILE\n"
      elsif(@type==WeaponType::PLASMA)
        cad=cad+", Tipo: PLASMA\n"
      else
        cad=cad+", Tipo: LASER\n"
      end
      return cad
    end
    
  end
end
