# frozen_string_literal: false

require 'secret_diary'

describe SecretDiary do
  it 'constructs' do
    diary = double(:diary)
    secret_diary = SecretDiary.new(diary)
    result = secret_diary.read
    expect(result).to eq('Go away!')
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
    result = secret_diary.read
    expect(result).to eq('Go away!')
  end
end
