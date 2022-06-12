INSERT INTO users(email, password, first_name, last_name, user_role)
    VALUES  ('admin@gmail.com', '$2a$12$rXeesz5vM89loJhcc9ha/ebHqOoQQv39aCAVzShGvqgdnMjHO./Ca', 'Master', 'Admin', 'ROLE_ADMIN');

INSERT INTO manufacturers(name)
    VALUES  ('Vichy'),
            ('Clinique'),
            ('Kerastase'),
            ('Artdeco'),
            ('Bobbi Brown');

INSERT INTO products (name, price, manufacturer_id)
    VALUES  ('Dercos Anti-Dandruff Advanced Action Shampoo',     319.00,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Vichy')),
            ('Mineral 89 Fortifying And Plumping Daily Booster', 744.55,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Vichy')),
            ('Liftactiv Supreme Day Normal to Combi Skin',       694.23,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Vichy')),
            ('Dercos Energising Shampoo',                        267.89,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Vichy')),
            ('Dercos Aminexil Clinical 5',                       1320.56,    (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Vichy')),
            ('Dercos Anti-Dandruff Deep Purifying Shampoo',      364.82,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Vichy')),
            ('48 Hr Anti-Perspirant Treatment',                  115.63,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Vichy')),

            ('Blended Face Powder and Brush',                    763.96,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Clinique')),
            ('Happy For Men',                                    707.00,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Clinique')),
            ('High Impact Mascara',                              462.23,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Clinique')),
            ('Anti-Blemish Solutions Liquid Makeup',             583.64,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Clinique')),
            ('Lash Power Mascara Long-Wearing Formula',          492.55,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Clinique')),
            ('Stay-Matte Sheer Pressed Powder Oil-Free',         699.45,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Clinique')),
            ('All About Eyes',                                   863.22,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Clinique')),
            ('High Impact Waterproof Mascara',                   470.02,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Clinique')),

            ('Nutritive 8H Magic Night Serum',                   794.56,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Kerastase')),
            ('Blond Absolu Masque Cicaextreme',                  1184.55,    (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Kerastase')),
            ('Blond Absolu Bain Lumiere Shampoo',                619.66,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Kerastase')),
            ('Resistance Therapist Serum',                       824.44,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Kerastase')),
            ('Resistance Therapist Bain',                        494.33,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Kerastase')),
            ('Genesis Hydra-Fortifiant Shampoo',                 577.89,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Kerastase')),

            ('Eyeshadow Base',                                   145.62,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Artdeco')),
            ('Hydra Lip Booster',                                187.00,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Artdeco')),
            ('Soft Eye Liner Waterproof',                        118.05,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Artdeco')),

            ('Highlighting Powder',                              782.23,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Bobbi Brown')),
            ('Luxe Lip Color',                                   505.00,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Bobbi Brown')),
            ('Skin Long-Wear Weightless Foundation SPF15',       795.00,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Bobbi Brown')),
            ('Perfectly Defined Long-Wear Brow Pencil',          795.06,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Bobbi Brown')),
            ('Smokey Eye Mascara 6ml',                           699.55,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Bobbi Brown')),
            ('Long-Wear Cream Shadow Stick',                     604.23,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Bobbi Brown')),
            ('Natural Brow Shaper',                              649.63,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Bobbi Brown')),
            ('Crushed Lip Color',                                477.84,     (SELECT m.manufacturer_id FROM manufacturers m WHERE m.name='Bobbi Brown'));