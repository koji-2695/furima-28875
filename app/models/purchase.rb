class Purchase
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :area_id, :municipality, :house_number, :building_name, :phone_number, :record 