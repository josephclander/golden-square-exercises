# frozen_string_literal: false

require 'secret_diary'

describe SecretDiary do
  it 'constructs' do
    diary = double(:diary)
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error 'Go away!'
  end

  it 'lets you read an UNLOCKED secret diary' do
    diary = double(:diary, read: 'The contents of my diary')
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    result = secret_diary.read
    expect(result).to eq('The contents of my diary')
  end

  it 'does NOT let you read a secret diary that has been unlocked and relocked' do
    diary = Diary.new('The contents of my diary')
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read }.to raise_error 'Go away!'
  end
end
