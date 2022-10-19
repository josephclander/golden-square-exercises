# frozen_string_literal: false

require 'time_error'

describe TimeError do
  it 'returns the difference in time' do
    fake_requester = double(:requester)
    allow(fake_requester).to receive(:get).with(
      URI('https://worldtimeapi.org/api/ip')
    ).and_return('{"abbreviation":"BST","client_ip":"213.230.194.2","datetime":"2022-10-19T10:16:41.188380+01:00","day_of_week":3,"day_of_year":292,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1666171001,"utc_datetime":"2022-10-19T09:16:41.188380+00:00","utc_offset":"+01:00","week_number":42}')
    
    time = Time.new(2022, 10, 19, 0, 0, 0)
    time_error = TimeError.new(fake_requester)

    expect(time_error.error(time)).to eq 37001.18838
  end
end
