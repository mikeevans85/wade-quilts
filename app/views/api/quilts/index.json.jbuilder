json.array! @quilts.each do |quilt|
  json.partial! "product.json.jbuilder", quilt: quilt
end