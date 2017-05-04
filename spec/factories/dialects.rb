FactoryGirl.define do
  factory :dialect do
    name "Yoda"
    code "yoda"
  end

  factory :binary_dialect, class: Dialect do 
    name  "Binary Code"
    code  "binary"
  end
end
