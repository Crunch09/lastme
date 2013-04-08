require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'lastme'
require 'json'

module Lastme

describe Connection do

  context 'user is not authenticated' do

    it 'fetches a new user token' do
      subject.stub(:request => JSON.parse(File.read('spec/assets/token.json')))
      token = subject.fetch_token
      token.should eq '0e04f0fe0b38104331c0964650097e29'
    end

    it 'fetches a new session' do
      subject.stub(:request => JSON.parse(File.read('spec/assets/token.json')))
      subject.stub(:authorized_request => JSON.parse(File.read('spec/assets/session.json')))
      session = subject.fetch_session
      session['name'].should eq 'crunch09'
      session['key'].should eq 'e8ef505267ad0e37f6b5efbb9275e1f4'
      session['subscriber'].should eq '1'
    end
  end


end

end
