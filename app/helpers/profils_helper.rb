module ProfilsHelper

def multi_path(obj)
  self.send("#{obj.type.pluralize.downcase}_path".to_sym, obj.reference)
end
end
