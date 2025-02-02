require 'rails_helper'
require 'rake'

RSpec.describe 'db:import_sigaa_data' do
  before do
    Rails.application.load_tasks
    FileUtils.mkdir_p('db/data')
    File.write('db/data/classes.json', File.read('spec/fixtures/classes.json'))
    File.write('db/data/class_members.json', File.read('spec/fixtures/class_members.json'))
  end

  after do
    FileUtils.rm_rf('db/data')
  end

  it 'importa dados corretamente' do
    expect {
      Rake::Task['db:import_sigaa_data'].invoke
    }.to change { Disciplina.count }.by(1)
       .and change { Turma.count }.by(1)
       .and change { Usuario.count }.by(2)
  end
end
