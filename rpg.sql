-- Creating Tables and adding constraints.

CREATE TABLE class
(
    class_id INTEGER NOT NULL,
    class_name VARCHAR2(25)
);

ALTER TABLE class ADD CONSTRAINT class_pk PRIMARY KEY ( class_id );

CREATE TABLE character
(
    character_id INTEGER NOT NULL,
    character_name VARCHAR2(25),
    atlevel INTEGER,
    experience INTEGER,
    player_id INTEGER NOT NULL,
    class_id INTEGER NOT NULL
);

ALTER TABLE character ADD CONSTRAINT character_pk PRIMARY KEY ( character_id );



CREATE TABLE characterquest
(
    character_quest_id INTEGER NOT NULL,
    character_id INTEGER NOT NULL,
    quest_id INTEGER NOT NULL
);

ALTER TABLE characterquest ADD CONSTRAINT characterquest_pk PRIMARY KEY ( character_quest_id );

CREATE TABLE inventory
(
    inventory_id INTEGER NOT NULL,
    total_capacity INTEGER,
    current_capacity INTEGER,
    character_id INTEGER NOT NULL
);

ALTER TABLE inventory ADD CONSTRAINT inventory_pk PRIMARY KEY ( inventory_id );

CREATE TABLE inventoryitem
(
    inventory_item_id INTEGER NOT NULL,
    quantity INTEGER,
    equipped NUMBER,
    durability INTEGER,
    item_id INTEGER NOT NULL,
    inventory_id INTEGER NOT NULL
);

ALTER TABLE inventoryitem ADD CONSTRAINT inventoryitem_pk PRIMARY KEY ( inventory_item_id );

CREATE TABLE item
(
    item_id INTEGER NOT NULL,
    item_name VARCHAR2(50),
    item_type VARCHAR2(50),
    required_level INTEGER,
    description VARCHAR2(250)
);

ALTER TABLE item ADD CONSTRAINT item_pk PRIMARY KEY ( item_id );

CREATE TABLE player
(
    player_id INTEGER NOT NULL,
    username VARCHAR2(25),
    email VARCHAR2(50),
    password VARCHAR2(50),
    registration_date DATE
);

ALTER TABLE player ADD CONSTRAINT player_pk PRIMARY KEY ( player_id );

CREATE TABLE quest
(
    quest_id INTEGER NOT NULL,
    quest_name VARCHAR2(150),
    quest_description VARCHAR2(500),
    required_level INTEGER
);

ALTER TABLE quest ADD CONSTRAINT quest_pk PRIMARY KEY ( quest_id );

CREATE TABLE reward
(
    reward_id INTEGER NOT NULL,
    quantity INTEGER,
    quest_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL
);

ALTER TABLE reward ADD CONSTRAINT reward_pk PRIMARY KEY ( reward_id );

ALTER TABLE character
    ADD CONSTRAINT character_class_fk FOREIGN KEY ( class_id )
        REFERENCES class ( class_id );

ALTER TABLE character
    ADD CONSTRAINT character_player_fk FOREIGN KEY ( player_id )
        REFERENCES player ( player_id );

ALTER TABLE characterquest
    ADD CONSTRAINT characterquest_character_fk FOREIGN KEY ( character_id )
        REFERENCES character ( character_id );

ALTER TABLE characterquest
    ADD CONSTRAINT characterquest_quest_fk FOREIGN KEY ( quest_id )
        REFERENCES quest ( quest_id );

ALTER TABLE inventory
    ADD CONSTRAINT inventory_character_fk FOREIGN KEY ( character_id )
        REFERENCES character ( character_id );

ALTER TABLE inventoryitem
    ADD CONSTRAINT inventoryitem_inventory_fk FOREIGN KEY ( inventory_id )
        REFERENCES inventory ( inventory_id );

ALTER TABLE inventoryitem
    ADD CONSTRAINT inventoryitem_item_fk FOREIGN KEY ( item_id )
        REFERENCES item ( item_id );

ALTER TABLE reward
    ADD CONSTRAINT reward_item_fk FOREIGN KEY ( item_id )
        REFERENCES item ( item_id );

ALTER TABLE reward
    ADD CONSTRAINT reward_quest_fk FOREIGN KEY ( quest_id )
        REFERENCES quest ( quest_id );






-- INSERTING DATA


-- Inserting data into the Class table
INSERT INTO class
    (class_id, class_name)
VALUES
    (1, 'Warrior');

INSERT INTO class
    (class_id, class_name)
VALUES
    (2, 'Mage');

INSERT INTO class
    (class_id, class_name)
VALUES
    (3, 'Hunter');

INSERT INTO class
    (class_id, class_name)
VALUES
    (4, 'Priest');

INSERT INTO class
    (class_id, class_name)
VALUES
    (5, 'Rogue');

-- Inserting data into the Item table
INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (1, 'Sword of the Crusader', 'Sword', 20, 'A powerful sword forged for the champions');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (2, 'Staff of Arcane Power', 'Staff', 18, 'An enchanted staff resonating with arcane energies');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (3, 'Hunter''s Bow', 'Bow', 22, 'A finely crafted bow favored by skilled hunters');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (4, 'Divine Robes', 'Robe', 15, 'Robes blessed with divine protection');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (5, 'Assassin''s Dagger', 'Dagger', 16, 'A deadly dagger used by stealthy assassins');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (6, 'Potion of Invisibility', 'Potion', 15, 'Grants temporary invisibility upon consumption');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (7, 'Scroll of Teleportation', 'Scroll', 18, 'Allows instant teleportation to a designated location');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (8, 'Health Potion', 'Potion', 5, 'Restores health when consumed');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (9, 'Mana Potion', 'Potion', 8, 'Restores mana when consumed');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (10, 'Elixir of Agility', 'Consumable', 10, 'Temporarily increases agility upon consumption');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (11, 'Elixir of Strength', 'Consumable', 12, 'Temporarily increases strength upon consumption');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (12, 'Tabard of the Alliance', 'Tabard', 20, 'Represents allegiance to the Alliance');

INSERT INTO item
    (item_id, item_name, item_type, required_level, description)
VALUES
    (13, 'Tabard of the Horde', 'Tabard', 20, 'Represents allegiance to the Horde');


-- Inserting data into the Player table
INSERT INTO player
    (player_id, username, email, password, registration_date)
VALUES
    (1, 'MightyWarrior', 'mightywarrior@example.com', 'warrior123', TO_DATE('2023-01-15', 'YYYY-MM-DD'));


INSERT INTO player
    (player_id, username, email, password, registration_date)
VALUES
    (2, 'MysticalMage', 'mysticalmage@example.com', 'magic456', TO_DATE('2023-02-20', 'YYYY-MM-DD'));


INSERT INTO player
    (player_id, username, email, password, registration_date)
VALUES
    (3, 'Huntmaster', 'huntmaster@example.com', 'hunt789', TO_DATE('2023-03-10', 'YYYY-MM-DD'));


INSERT INTO player
    (player_id, username, email, password, registration_date)
VALUES
    (4, 'DivineHealer', 'divinehealer@example.com', 'healpass', TO_DATE('2023-04-05', 'YYYY-MM-DD'));


INSERT INTO player
    (player_id, username, email, password, registration_date)
VALUES
    (5, 'ShadowAssassin', 'shadowassassin@example.com', 'assassinpass', TO_DATE('2023-05-12', 'YYYY-MM-DD'));



-- Inserting data into the Character table
INSERT INTO character
    (character_id, character_name, atlevel, experience, player_id, class_id)
VALUES
    (1, 'Varian', 25, 15000, 1, 1);


INSERT INTO character
    (character_id, character_name, atlevel, experience, player_id, class_id)
VALUES
    (2, 'Jaina', 20, 12000, 2, 2);


INSERT INTO character
    (character_id, character_name, atlevel, experience, player_id, class_id)
VALUES
    (3, 'Rexxar', 22, 13500, 3, 3);


INSERT INTO character
    (character_id, character_name, atlevel, experience, player_id, class_id)
VALUES
    (4, 'Anduin', 18, 10000, 4, 4);


INSERT INTO character
    (character_id, character_name, atlevel, experience, player_id, class_id)
VALUES
    (5, 'Valeera', 21, 13000, 5, 5);



-- Inserting data into the Quest table
INSERT INTO quest
    (quest_id, quest_name, quest_description, required_level)
VALUES
    (1, 'Defeat the Lich King', 'Confront the fearsome Lich King in the Frozen Throne', 20);


INSERT INTO quest
    (quest_id, quest_name, quest_description, required_level)
VALUES
    (2, 'Retrieve the Artifact', 'Recover the ancient artifact from the depths of Blackrock Mountain', 18);


INSERT INTO quest
    (quest_id, quest_name, quest_description, required_level)
VALUES
    (3, 'Hunt the Beasts', 'Track and hunt down the ferocious beasts in Stranglethorn Vale', 15);


INSERT INTO quest
    (quest_id, quest_name, quest_description, required_level)
VALUES
    (4, 'Heal the Wounded', 'Provide healing aid to the wounded soldiers in the battlegrounds', 18);


INSERT INTO quest
    (quest_id, quest_name, quest_description, required_level)
VALUES
    (5, 'Assassinate the Target', 'Eliminate the notorious target in the shadows of Stormwind', 20);




-- Inserting data into the Reward table
INSERT INTO reward
    (reward_id, quantity, quest_id, item_id)
VALUES
    (1, 1, 1, 1);


INSERT INTO reward
    (reward_id, quantity, quest_id, item_id)
VALUES
    (2, 1, 2, 2);


INSERT INTO reward
    (reward_id, quantity, quest_id, item_id)
VALUES
    (3, 1, 3, 3);


INSERT INTO reward
    (reward_id, quantity, quest_id, item_id)
VALUES
    (4, 1, 4, 4);


INSERT INTO reward
    (reward_id, quantity, quest_id, item_id)
VALUES
    (5, 1, 5, 5);



-- Inserting data into the Inventory table
INSERT INTO inventory
    (inventory_id, total_capacity, current_capacity, character_id)
VALUES
    (1, 50, 30, 1);


INSERT INTO inventory
    (inventory_id, total_capacity, current_capacity, character_id)
VALUES
    (2, 40, 25, 2);


INSERT INTO inventory
    (inventory_id, total_capacity, current_capacity, character_id)
VALUES
    (3, 60, 40, 3);


INSERT INTO inventory
    (inventory_id, total_capacity, current_capacity, character_id)
VALUES
    (4, 45, 28, 4);


INSERT INTO inventory
    (inventory_id, total_capacity, current_capacity, character_id)
VALUES
    (5, 55, 35, 5);



-- Inserting data into the InventoryItem table
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (1, 1, 1, 100, 1, 1);


INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (2, 1, 1, 100, 2, 2);


INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (3, 1, 1, 100, 3, 3);


INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (4, 1, 1, 100, 4, 4);


INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (5, 1, 1, 100, 5, 5);

INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (6, 3, 0, NULL, 8, 3);

INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (7, 5, 1, NULL, 8, 1);



-- MORE EXAMPLES FOR INVENTORY ITEMS
-- Valeera's Inventory
-- Health Potion (ID: 8)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (8, 2, 0, NULL, 8, 5);

-- Mana Potion (ID: 9)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (9, 2, 0, NULL, 9, 5);

-- Elixir of Agility (ID: 10)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (10, 2, 0, NULL, 10, 5);

-- Elixir of Strength (ID: 11)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (11, 2, 0, NULL, 11, 5);

-- Tabard of the Alliance (ID: 12)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (12, 2, 0, NULL, 12, 5);

-- Tabard of the Horde (ID: 13)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (13, 2, 0, NULL, 13, 5);

-- Jaina's Inventory
-- Health Potion (ID: 8)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (14, 2, 0, NULL, 8, 2);

-- Mana Potion (ID: 9)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (15, 2, 0, NULL, 9, 2);

-- Elixir of Agility (ID: 10)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (16, 2, 0, NULL, 10, 2);

-- Elixir of Strength (ID: 11)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (17, 2, 0, NULL, 11, 2);

-- Tabard of the Alliance (ID: 12)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (18, 2, 0, NULL, 12, 2);

-- Tabard of the Horde (ID: 13)
INSERT INTO inventoryitem
    (inventory_item_id, quantity, equipped, durability, item_id, inventory_id)
VALUES
    (19, 2, 0, NULL, 13, 2);


-- Inserting data into the CharacterQuest table
INSERT INTO characterquest
    (character_quest_id, character_id, quest_id)
VALUES
    (1, 1, 2);

INSERT INTO characterquest
    (character_quest_id, character_id, quest_id)
VALUES
    (2, 2, 3);

INSERT INTO characterquest
    (character_quest_id, character_id, quest_id)
VALUES
    (3, 3, 4);

INSERT INTO characterquest
    (character_quest_id, character_id, quest_id)
VALUES
    (4, 4, 4);

INSERT INTO characterquest
    (character_quest_id, character_id, quest_id)
VALUES
    (5, 5, 5);

INSERT INTO characterquest
    (character_quest_id, character_id, quest_id)
VALUES
    (6, 1, 1);

INSERT INTO characterquest
    (character_quest_id, character_id, quest_id)
VALUES
    (7, 2, 2);

INSERT INTO characterquest
    (character_quest_id, character_id, quest_id)
VALUES
    (8, 3, 3);




-- Selecting data and joining tables.

-- Retrieve id of character, name of character and current level of the character.

SELECT character_id, character_name, atlevel
FROM character;

-- Retrieve player registration dates, usernames, character names, and associated classes. Sort by reg. date.

SELECT p.registration_date, p.username, ch.character_name, cl.class_name
FROM player p
    JOIN character ch ON p.player_id = ch.player_id
    JOIN class cl ON ch.class_id = cl.class_id
ORDER BY p.registration_date;

-- Retrieve character names and their corresponding inventory details.

SELECT ch.character_name, inv.total_capacity, inv.current_capacity
FROM character ch
    JOIN inventory inv ON ch.character_id = inv.character_id;

-- Retrieve player email together with the id of the character, character name, character level, and total amount of items (SORT by item amount)

SELECT pl.email AS player_email, c.character_id, c.character_name, c.atlevel AS character_level, COUNT(ii.inventory_item_id) AS total_items
FROM character c
    JOIN inventory inv ON c.character_id = inv.character_id
    JOIN inventoryitem ii ON inv.inventory_id = ii.inventory_id
    JOIN player pl ON c.player_id = pl.player_id
GROUP BY c.character_id, c.character_name, c.atlevel, pl.email
ORDER BY total_items DESC;

-- Retrieve username, character name, character class, current (latest) character quest and reward for the quest.

SELECT p.username AS "Username",
    ch.character_name AS "Character Name",
    cl.class_name AS "Character Class",
    q.quest_name AS "Current Quest",
    i.item_name AS "Reward for Quest"
FROM player p
    JOIN character ch ON p.player_id = ch.player_id
    JOIN class cl ON ch.class_id = cl.class_id
    JOIN characterquest cq ON ch.character_id = cq.character_id
    JOIN quest q ON cq.quest_id = q.quest_id
    JOIN reward r ON q.quest_id = r.quest_id
    JOIN item i ON r.item_id = i.item_id
WHERE cq.character_quest_id IN (
    SELECT MAX(character_quest_id)
FROM characterquest
WHERE character_id = ch.character_id
);

-- Retrieve character name (sorted by name), Name of Items in inventory, type of item, durability, quantity, if item is equipped, required level, description.

SELECT
    ch.character_name AS "Character Name",
    i.item_name AS "Item Name",
    i.item_type AS "Item Type",
    ii.quantity AS "Item Quantity",
    ii.durability AS "Item Durability",
    ii.equipped AS "Equipped",
    i.required_level AS "Required Level",
    i.description AS "Item Description"
FROM
    inventoryitem ii
    JOIN
    item i ON ii.item_id = i.item_id
    JOIN
    inventory inv ON ii.inventory_id = inv.inventory_id
    JOIN
    character ch ON inv.character_id = ch.character_id
WHERE 
    ch.character_name IN ('Jaina', 'Valeera')
ORDER BY 
    ch.character_name;


