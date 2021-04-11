puts 'ENTITY_DATA'

sample = <<~RUBY

  # UX / UI

  data_shapes = KBuilder::SampleDataBuilder
    .init


  web_pages = KBuilder::WebPagesBuilder
  .init

  .form(:data_entry_pages)
    .columns
      .field(:name)
      .field(:number, :integer)
      .field(:exp_date, :date_time)

  .model(:data_references)
    .columns
      .field(:suburb)
      .field(:postcode)
RUBY

