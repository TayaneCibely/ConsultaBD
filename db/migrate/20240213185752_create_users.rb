class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :user_type

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Outras colunas específicas de usuários
      # t.integer :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string :current_sign_in_ip
      # t.string :last_sign_in_ip

      ## Confirmable
      # t.string :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string :unconfirmed_email # Apenas se estiver usando reconfirmable

      ## Lockable
      # t.integer :failed_attempts, default: 0, null: false # Apenas se a estratégia de bloqueio for :failed_attempts
      # t.string :unlock_token # Apenas se a estratégia de desbloqueio for :email ou :both
      # t.datetime :locked_at

      # Descomente abaixo se os timestamps não foram incluídos no seu modelo original.
      # t.timestamps null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token, unique: true
    # add_index :users, :unlock_token, unique: true
  end
end
