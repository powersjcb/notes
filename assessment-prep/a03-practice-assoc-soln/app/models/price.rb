class Price < ActiveRecord::Base
  belongs_to(
    :company,
    primary_key: :id,
    foreign_key: :company_id,
    class_name: "Company"
  )
end
