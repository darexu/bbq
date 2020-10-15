require 'rails_helper'

RSpec.describe EventPolicy do
  let(:user) { User.new }

  # объект тестирования (политика)
  subject { EventPolicy }

  context 'when user is not an owner' do
    let(:event) {Event.create(title: 'Шашлык', description: 'Шашлык у речки')}

    permissions :create? do
      it { is_expected.to permit(user, Event) }
      it { is_expected.not_to permit(nil, Event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, event) }
    end
  end

  context 'when user is an owner' do
    let(:event) {Event.create(title: 'Шашлык', description: 'Шашлык у речки', user: user)}

    permissions :show?, :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end

  context 'when user is unauthorized' do
    let(:event) {Event.create(title: 'Шашлык', description: 'Шашлык у речки', user: user)}

    permissions :show? do
      it { is_expected.to permit(nil, event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
  end
end