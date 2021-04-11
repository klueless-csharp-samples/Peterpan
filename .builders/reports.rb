puts 'ENTITY_DATA'

sample = <<~RUBY


reports = KBuilder::ReportsBuilder
.init

.report(:day_list)
  .query_columns
    .field(:room_name)

  .display_columns
    .field(:name)

RUBY

