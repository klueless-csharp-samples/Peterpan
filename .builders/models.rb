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

RUBY

