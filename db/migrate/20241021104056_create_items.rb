class CreateItems < ActiveRecord::Migration[7.2]
  def up
    execute <<-SQL
      CREATE TABLE `items` (
        `id`                   bigint(20)    NOT NULL AUTO_INCREMENT,
        `uuid`                 varchar(36)   NOT NULL,
        `price`                decimal(10,2)    NOT NULL,
        `brand`                varchar(255)  NOT NULL,
        `photo_url`            text          NOT NULL,
        `status`               tinyint(1)    NOT NULL,
        `user_id`              bigint(20)    NOT NULL,
        `created_at`           datetime(6)   NOT NULL,
        `updated_at`           datetime(6)   NOT NULL,

        PRIMARY KEY (`id`),
        UNIQUE KEY `index_items_on_uuid` (`uuid`),
        CONSTRAINT `fk_items_users`
            FOREIGN KEY (`user_id`)
            REFERENCES `users` (`id`)
            ON DELETE CASCADE
      ) ENGINE=InnoDB COLLATE=utf8mb4_bin;
    SQL
  end

  def down
    drop_table :items
  end
end