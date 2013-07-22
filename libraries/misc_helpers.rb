
def attribute_exists? (*attributes)
  parent = node
  attributes.each { |a|
    return false unless parent[a]
    parent = parent[a]
  }
  true
end
