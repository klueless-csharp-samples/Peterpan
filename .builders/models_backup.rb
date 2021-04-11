puts 'ENTITY_DATA'
sample = <<~RUBY

  data_shapes = KBuilder::SampleDataBuilder
    .init

    .model(:health_care_card, aka: :hcc)
      .columns
        .field(:name)
        .field(:number, :integer)
        .field(:exp_date, :date_time)

    .model(:data_references)
      .columns
        .field(:suburb)
        .field(:postcode)

    .model(:master_doc)
        .columns(34 fields)
          .field(:name)
          .field(:age)
        .relations
          .has_one(:address, :postal, :postal_address_id)
          .has_one(:address, :billing, :billing_address_id)
      
  data_shapes = KBuilder::SampleDataBuilder
    .init
    .model(:user)
      .field(:user_name)
      .field(:user)
      .field(:email)
      
      .sample_data
        .row(:bad_ass, 'Ken Va', 'ken@foliage.com.au')
        .row(:louise, 'Louise', 'louise@gmail.com')
        .row(:alex, 'Alexandro', 'alex@gmail.com')

    .model(:role)
      .field(:name)

      .sample_data
        .row(:owner)
        .row(:staff)

    .model(:account)
      .field(:type)
      .field(:name)
      
      .sample_data
        .row(:cafe_owner, 'The Foliage Cafe'  ).has_many(:users).row(:bad_ass , role: :owner).row(:louise, role: :staff)
        .row(:cafe_owner, 'The North Spoon'   ).has_many(:users).row(:alex    , role: :owner)
        .row(:cafe_owner, 'Breadworks Cafe'   ).has_many(:users).row(:bad_ass , role: :owner)

    .model(:groups, aka: :co_ops)
      .field(:name)
      
      .sample_data
        .row(:vietnamese)
        .row(:thai)
        .row(:korean)

    .model(:professional_service_types)
      .field(:name)
      
      .sample_data
        .row(:roasting)
        .row(:mechanic)

    .model(:vendor_types)
      .field(:name)
      .field(:examples)
      
      .sample_data
        .row(:milk)
        .row(:tea)
        .row(:coffee_beans)
        .row(:dry_goods, [:lids, :paper_cups, :napkins, :cardboard_sleaves, :straws, :paper_towels])
        .row(:coffee_equipment, [:coffee_presses, :coffee_grinders, :espresso_machine, :water_filters])
        .row(:cafe_equipment, [:food_prep_tables, :food_storage_bins, :bottles, :pumps, :blenders, :ovens, :grills, :toasters, :ice_makers])
        .row(:produce)
        .row(:butchers)
        .row(:organic)
        .row(:farmers)
        .row(:baked_goods, [:muffins, :pastry])
        .row(:alcohol, [:wine, :spirits, :beer])

    .model(:registries)
      .field(:name)
      
      .sample_data
        .row(:cafes)
        .row(:coffee_providers)

    .model(:professional_service)
      .field(:name)
      
      .sample_data
        .row(:)
        .row(:)
        .row(:)


    .model(:credit_application)
      .field(:tax_id)
      .field(:delivery_address)
      .field(:billing_address)
      .field(:date_opened)
      .field(:own_lease)
      .field(:landlord_details)
      .field(:bank_details)
      .field(:partner_names)
    


  entities = KBuilder::EntityBuilder
    .init
    
    .entity(:account)
      .columns
        .column(:name)
        .column(:type, values: [:cafe_owner, :staff])
    
    .entity(:sale)
      .columns
        .column(:time, :date_time)
        .column(:price, :decimal)
      .relations
        .relation(:item, :one_many, reference_type: :sale_line_item)

    .entity(:sale_line_item)
      .column(:quantity, :int)
      .relation(:product, :many_one)

    .entity(:sale_line_item)
      .column(:quantity, :int)
      .relation(:product, :many_one)
      .relation(:sale, :many_one)

    .entity(:store)
      .column(:trading_name)
      .relation(:terminal, :one_many)
      .relation(:product, :one_many)

    .entity(:terminal)
      .column(:name)
      .relation(:sale, :one_many)

RUBY

