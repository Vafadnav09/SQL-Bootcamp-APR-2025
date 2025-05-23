PGDMP  !    2                }           SQLBootcamp    17rc1    17rc1 1    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            .           1262    16714    SQLBootcamp    DATABASE     �   CREATE DATABASE "SQLBootcamp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "SQLBootcamp";
                     postgres    false            �            1259    16723 
   categories    TABLE     �   CREATE TABLE public.categories (
    "categoryID" integer NOT NULL,
    "categoryName" character varying(50) NOT NULL,
    description text
);
    DROP TABLE public.categories;
       public         heap r       postgres    false            �            1259    16722    categories_categoryID_seq    SEQUENCE     �   CREATE SEQUENCE public."categories_categoryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."categories_categoryID_seq";
       public               postgres    false    220            /           0    0    categories_categoryID_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."categories_categoryID_seq" OWNED BY public.categories."categoryID";
          public               postgres    false    219            �            1259    16742 	   customers    TABLE       CREATE TABLE public.customers (
    "customerID" character(5) NOT NULL,
    "companyName" character varying NOT NULL,
    "contactName" character varying,
    "contactTitle" character varying,
    city character varying(50),
    country character varying(50)
);
    DROP TABLE public.customers;
       public         heap r       postgres    false            �            1259    16750 	   employees    TABLE     �   CREATE TABLE public.employees (
    "employeeID" integer NOT NULL,
    "employeeName" character varying,
    title character varying,
    city character varying(50),
    country character varying(50),
    "reportsTo" integer
);
    DROP TABLE public.employees;
       public         heap r       postgres    false            �            1259    16749    employees_employeeID_seq    SEQUENCE     �   CREATE SEQUENCE public."employees_employeeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."employees_employeeID_seq";
       public               postgres    false    225            0           0    0    employees_employeeID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."employees_employeeID_seq" OWNED BY public.employees."employeeID";
          public               postgres    false    224            �            1259    16770    order_details    TABLE     �   CREATE TABLE public.order_details (
    "orderID" integer NOT NULL,
    "productID" integer NOT NULL,
    unitprice numeric(10,2),
    quantity integer,
    discount numeric(4,2)
);
 !   DROP TABLE public.order_details;
       public         heap r       postgres    false            �            1259    16758    orderid    SEQUENCE     t   CREATE SEQUENCE public.orderid
    START WITH 10248
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.orderid;
       public               postgres    false            �            1259    16759    orders    TABLE       CREATE TABLE public.orders (
    "orderID" integer DEFAULT nextval('public.orderid'::regclass) NOT NULL,
    "customerID" character(5),
    "employeeID" integer,
    orderdate date,
    requireddate date,
    shippeddate date,
    "shipperID" integer,
    freight numeric(10,2)
);
    DROP TABLE public.orders;
       public         heap r       postgres    false    226            �            1259    16734    products    TABLE     �   CREATE TABLE public.products (
    "productID" integer NOT NULL,
    "productName" text,
    "quantityPerUnit" text,
    "unitPrice" numeric(10,2),
    discontinued boolean,
    "categoryID" integer
);
    DROP TABLE public.products;
       public         heap r       postgres    false            �            1259    16733    products_productID_seq    SEQUENCE     �   CREATE SEQUENCE public."products_productID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."products_productID_seq";
       public               postgres    false    222            1           0    0    products_productID_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."products_productID_seq" OWNED BY public.products."productID";
          public               postgres    false    221            �            1259    16716    shippers    TABLE     d   CREATE TABLE public.shippers (
    "shipperID" integer NOT NULL,
    "companyName" text NOT NULL
);
    DROP TABLE public.shippers;
       public         heap r       postgres    false            �            1259    16715    shippers_shipperid_seq    SEQUENCE     �   CREATE SEQUENCE public.shippers_shipperid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.shippers_shipperid_seq;
       public               postgres    false    218            2           0    0    shippers_shipperid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.shippers_shipperid_seq OWNED BY public.shippers."shipperID";
          public               postgres    false    217            t           2604    16726    categories categoryID    DEFAULT     �   ALTER TABLE ONLY public.categories ALTER COLUMN "categoryID" SET DEFAULT nextval('public."categories_categoryID_seq"'::regclass);
 F   ALTER TABLE public.categories ALTER COLUMN "categoryID" DROP DEFAULT;
       public               postgres    false    220    219    220            v           2604    16753    employees employeeID    DEFAULT     �   ALTER TABLE ONLY public.employees ALTER COLUMN "employeeID" SET DEFAULT nextval('public."employees_employeeID_seq"'::regclass);
 E   ALTER TABLE public.employees ALTER COLUMN "employeeID" DROP DEFAULT;
       public               postgres    false    224    225    225            u           2604    16737    products productID    DEFAULT     |   ALTER TABLE ONLY public.products ALTER COLUMN "productID" SET DEFAULT nextval('public."products_productID_seq"'::regclass);
 C   ALTER TABLE public.products ALTER COLUMN "productID" DROP DEFAULT;
       public               postgres    false    221    222    222            s           2604    16719    shippers shipperID    DEFAULT     z   ALTER TABLE ONLY public.shippers ALTER COLUMN "shipperID" SET DEFAULT nextval('public.shippers_shipperid_seq'::regclass);
 C   ALTER TABLE public.shippers ALTER COLUMN "shipperID" DROP DEFAULT;
       public               postgres    false    217    218    218                       0    16723 
   categories 
   TABLE DATA           O   COPY public.categories ("categoryID", "categoryName", description) FROM stdin;
    public               postgres    false    220   �:       #          0    16742 	   customers 
   TABLE DATA           n   COPY public.customers ("customerID", "companyName", "contactName", "contactTitle", city, country) FROM stdin;
    public               postgres    false    223   �;       %          0    16750 	   employees 
   TABLE DATA           d   COPY public.employees ("employeeID", "employeeName", title, city, country, "reportsTo") FROM stdin;
    public               postgres    false    225   �H       (          0    16770    order_details 
   TABLE DATA           ^   COPY public.order_details ("orderID", "productID", unitprice, quantity, discount) FROM stdin;
    public               postgres    false    228   �I       '          0    16759    orders 
   TABLE DATA           �   COPY public.orders ("orderID", "customerID", "employeeID", orderdate, requireddate, shippeddate, "shipperID", freight) FROM stdin;
    public               postgres    false    227   >r       "          0    16734    products 
   TABLE DATA           z   COPY public.products ("productID", "productName", "quantityPerUnit", "unitPrice", discontinued, "categoryID") FROM stdin;
    public               postgres    false    222   V�                 0    16716    shippers 
   TABLE DATA           >   COPY public.shippers ("shipperID", "companyName") FROM stdin;
    public               postgres    false    218   p�       3           0    0    categories_categoryID_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."categories_categoryID_seq"', 1, false);
          public               postgres    false    219            4           0    0    employees_employeeID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."employees_employeeID_seq"', 1, false);
          public               postgres    false    224            5           0    0    orderid    SEQUENCE SET     :   SELECT pg_catalog.setval('public.orderid', 10248, false);
          public               postgres    false    226            6           0    0    products_productID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."products_productID_seq"', 1, false);
          public               postgres    false    221            7           0    0    shippers_shipperid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.shippers_shipperid_seq', 1, false);
          public               postgres    false    217            {           2606    16730    categories categories_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY ("categoryID");
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public                 postgres    false    220                       2606    16811    customers customers_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY ("customerID");
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public                 postgres    false    223            �           2606    16757    employees employees_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY ("employeeID");
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public                 postgres    false    225            �           2606    16774     order_details order_details_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY ("orderID", "productID");
 J   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_pkey;
       public                 postgres    false    228    228            �           2606    16764    orders orders_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderID");
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    227            }           2606    16741    products products_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productID");
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 postgres    false    222            y           2606    16721    shippers shippers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY ("shipperID");
 @   ALTER TABLE ONLY public.shippers DROP CONSTRAINT shippers_pkey;
       public                 postgres    false    218            �           2606    16805    products fk_catid    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_catid FOREIGN KEY ("categoryID") REFERENCES public.categories("categoryID");
 ;   ALTER TABLE ONLY public.products DROP CONSTRAINT fk_catid;
       public               postgres    false    222    220    4731            �           2606    16812    orders fk_custid    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_custid FOREIGN KEY ("customerID") REFERENCES public.customers("customerID");
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_custid;
       public               postgres    false    227    223    4735            �           2606    16790    orders fk_empid    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_empid FOREIGN KEY ("employeeID") REFERENCES public.employees("employeeID");
 9   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_empid;
       public               postgres    false    227    4737    225            �           2606    16795    orders fk_shipid    FK CONSTRAINT        ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_shipid FOREIGN KEY ("shipperID") REFERENCES public.shippers("shipperID");
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_shipid;
       public               postgres    false    227    218    4729            �           2606    16775 (   order_details order_details_orderID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "order_details_orderID_fkey" FOREIGN KEY ("orderID") REFERENCES public.orders("orderID");
 T   ALTER TABLE ONLY public.order_details DROP CONSTRAINT "order_details_orderID_fkey";
       public               postgres    false    228    227    4739            �           2606    16780 *   order_details order_details_productID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "order_details_productID_fkey" FOREIGN KEY ("productID") REFERENCES public.products("productID");
 V   ALTER TABLE ONLY public.order_details DROP CONSTRAINT "order_details_productID_fkey";
       public               postgres    false    228    222    4733                �   x�5O�n�0����ԩ(��9�:0��-�!�d�r��}i9]xy�;>�=�`:B̡���|�G�K��6�uX�rp4A��t%�tA�z�Զ��),~�eLINk'3��]AT�䔏b_V�_S�bz���j���~���}5=%���ū{wҜ��|1�,��uP�$f7�L���I*m�����U=�2U���1#����~��	����KڞA�����4P,%��aC�G���<Yk� ��y�      #   �  x��X˒�H]'_��񪪿A2�T��I�,�Fdҙ��!�iO�Wы�����\�*S�^����s�=7��?
�W>Y�;ޯ�Jڕr�dca���Υu,�t<�+�ԕ��V�����l �Z�}Ǜx��yZ�?��4<Xo��8��,�?a�NK�����U�?�s�x��VF+���Jm�L�RK�|���3I<�1ϚZ�*$�٬0k��P�|;����h6u�A2H)�e	�;-�U�����E��9�b�|q/_+�����eQ]���,��\�N7��0W
�S)yO�j%*��p6��Ƽ��1�/�Z_�ލ����ty�J�i~��ˊ?�ұ�m���W��8J��g��J��%�=�D�R����K�:��n�=�m~+U����ʑ18��
�IF���Y�a�T�[��t#B�'|3�����D�Ze�Gr�
�/G�����>y6�XU��]ϔ����cA�b!��GJg����2��E03'v�M��Or�����u�9j+-~�؃�P��+v�Vŏp�{�l�YU�k>�߷²���ʀ�T�7���%��n�⍂q��>p:~0����;kxf��L� �*y�����H��F�n�����4�;W�=�*���X��d�z�^�Tu@+�w�x<�b(�1�)k�T���{2ڙsX��
�H��SQ���VT	+�t+�1�����2���صf���^��=ֳ"+�^�u��]ҭ�<��R�����ڃ�n��� �^���/���4�q�H,l��)7��3&/E�f���Zf�����pi���� ��rX�*�Z��P��X����� �̫���7=�kUN�/�Z�27����><�ꁨ�����i
;���Re�����s<=+TV ��w�zJ.O��X/����>J����5�w�Jg��5_��/�"A��F1YZq������ ���K'���K��g.�'�d�ZYI��v� XEd���~i��/@AV��/0��S�-�I�kUU7l�	J�o
�|n(�Sa0	)�H�m���C�aa%Jx3O�.��|Wd�,D�%�+��^ }���j,kyx��H�����R���=6�ohrr��/d����ڰ �1�ZBl���F�]a3�#N�Ľ8eCs��@o�m�+�޸�+?�E�ʽ���K���Z�',=�Xe�hI9�����}����פ���ug����!+�Y�}c���`C�C�<���8q^�@�d�ԃ�8M�Q��%'<�V�ɛJR'H#��	������@�����өi�r��|B�|{
jF���5	�ɝ�@٠`�D懠����mX�LE
�������d�a�����M%y�� /<ibN G0C����\B�Q��Z|��J���D-����H>�&#�M6�Zߨ��+Z��0��]˒3�$�e	��ⴼى��!� �QL6j~�jY��x�N�i� �����7��δy~�@�`,��<'`ujt��� fP����~ 6"���C䍽�쭅���甤��@�2�z�,3|hj'�6�.	�eA���j�Xʗ��ܩx3�k���� k�޶�mR�}�0��Þ���Љb���y��H�>���k�(�S�)Ԯm����DjdS�9��Z�~��Cq?��V"��d����O>�)��6��?K��؍���d:z���a�ޥ�!�����h`���g��ѕ�=�\��T�Y�D�$�1z�#5���:��:�3�zr)���F&���J<�O�)i�������i��ҖW)y������p�@c��������(�'Q�V�:e��>0[�Dݢxl0b}B@j�ïZ���N�/lO�8<�!nm�Y�X�J�B����UdJ} ��d[鴢onBs��N���`��I3��@:�Z+�*l��3�.��_P��b$�栮�=��Y�&��JMM�_A�̎b���j.�o�b���U%��"�U��g�$��5 &������c��2�����'�,������=��дP�����jE٨��h禽Rj�Z��>��Ю�Gx�)˫�bҤ�k��6�W�FT�|=N0I�nE\y:���LN� 	}�/P=yz^�2$�)���Ѯ�~0�n�4���c6U�R�)��ײ�`� Zgs��Eh Ζ��rz����M��L:(`�=��J���w�T���yc1y%�~����\�[|��jw�VOuq ���Ƃ	��a�����47AV[(A��������������b���n�[����� B����c|�G7��߃�R��[�{�7���jh4Ĥ�躣F�3�@�������墦� �kq��D.�
��*(�҅	x8^�˨�vv{��h�:q@�� �TE/�O��ފʅ�@�$�n/6�K��l����F6����~�Z��n~%�l?O�q�$���{^���,�	_[ʚV��n�7�hX���I}c�CO�WYu�D�s����0wb�����[y'�JS]�f�����M�k�;�,����=�x�Q�:�f�Q���^k.,���{$m��m�����h���>2�.�j֓��I���C�1�O��g��.�@bV��^0^:���`�*�<��o��(T�_k�;���xڹuL�|���zc������1 I8;l��+D���m�_@� �2|gà�Y�VK���~"u����Z�_�	����4�2�m˻�3��Q/.��ԥ{���x�N![�Pjy8��K���h���M��X�i�_8h�1=�ݘ�����h�Ş����a�Vv<K�ސ�{D��_��U��� ~�������;��ٰ5��w�����H|j���r���B�O�r���]]R������ӓ,?��ДSHkh�E{��?�?,����?�[���wpt��lEɆ�Gǖ�t[>c�!�3�GK!QfƔ�����Z�נ)���9� ).���Mz#�L��F��.�Fu��6�x#���\]p��%�![��i�]�j� �g���L�7/�˚��n���|�I��e��s�@ T~�=hm����	9��s��!��c��6~	9}���K��-�ԙ=e;���>��x�0����Z@���Vf���~��b��Sf/��G�=�H+��G�Ir�q�w��B�؃Ě�S���r�bG��5���N����&�      %   �   x���Ak�@�ϳ�b~�`Z�=�J5	b�P�2n�dq�-�M��"�V�Ro�����J{��� y�p��K������t�j3��\jM���{Vxs�q� W'/�̶4w�J�sX��榨{(H���l����	T1�>��%!���47�q��%d�
�D��Ot�������:�X#.�<�|9�J�L�S���U��<��
�"��1hl��ߎ�1g:���      (      x�m�k�m�
��Әߏ�T��Q�1p��䦾x\NE@@�w!���?������s�����S���6�cZ�/&��������_g����/�_By���տj:TG���K��2�A��BظH��:��0fc��G�_�_e~�^�8�_�����4Կ`�%��;7[[,S2�<0��*Қ;I��~QG�?1��u�_�qM�6У�����C����_�s�8�����i�A�N�o�;i�3�Z�˓��1������	)L�5n�1Y��Set%3�c��.�3'�E���������8��*J�q�2�눵��󠫲��aЪ:c���7�3:���f6m�X��h�r�QD�иq�ߗﶍ�xE���+Br4虹 ���6V����y���p���$F��*d�Q��_!���'��=���ʐ�����2U��ʲ�A�n�e0����a�7�ƴ.E�y�?XI���PHE�qPQ>,$༱vBzP���>t����9�J�P?^��j�g|4C�am+��n���)$�� /+4���1�v�݉}Q�%K�Zyoq�:�����15Xc*�Mfa�a'}���>�m
���))�,�1�C��"�O�����F����Z��E��t
>ChL��2X% �&����!+6�v�;��I�>ƈ�W��Ҝc5bv�L�w���D��U(��3pL{|��Ne8P֬�!uòKS���t���c#��I[S��'�X_�;�4�A�3c�C,�9�N�n���%L�Ս���xxQ+����0X�4�}����)�IE�W�٫�Ui[Y���a��{�~��8�N�c<�Mh�0�qr�/��0<�d�Z��m����)�.��C���Q4�����8q�x��y�Yo0��˘�Ih���8^j��'�hqc{�q�6�LdW�������ظ�4��
t=�"{�o��t:�Y/m�HV��,P�c*䫋]ġ�d���u9-mEj�zU���'��v}�'�c��W���UP���c3Xg��<�Q<���I":�z�!8�)F�$�Ҫ�������3�=�ծ+�J�?��L`�:�4��<5�:�<�N�(z�R@سa�2�w	c �'3��.1��4A�pV���qE�qxȤ6�iw�p��	��g9�	��A�)�F4��M��"�R)��EE�B�5�j#q��
-��V�7&CFؠ��S��b� � �:�f�0���S�p5X8�D��ɦ�o�Äg`��84��	���U�y�����i�Зˑ�c%�P�W�}�29;v�הFĤ*AbGr ��� b�4N�nm���=�O�;0B`��F�ȉ��Z���w��SkB�$ҁ�40�9��LT�X�v0�ئD������BK�l�M:��B�l�̃���8�CZ"���0�x�wv�3����	��E�t�ͺ뛡���O��F\�����R��S��V�A� Q�+qc>k�g���?	��.!��󧇱�ެD�թö��dc�����TX+7F�����P5�h�S�4��H"�:<� ���0�i?n5M�T4y�P	��'�-Q�#���t�#鐎O��Y&eEu`=�BJ��L^���V�-����X������+/��f�P쁶�lV]0o��0e��0@]I]��� 3$��E�5D�P���MS�����C�W���Sa����!}x���8
vRf�������z��M�)֞q����h�9��k� R'��4G�Z5��|��P"��5�X3g�+�?;ƌ��K��!��W��Û�^"�؆�_��"M6��R8�΁�^��}�M�qS�e	��'���MǸa����<���g_6�م�.�~Tcl�֊u	
��A�y:b6d�b`�>Wg�Ȫ��f�=?G�G��WUj�3��͐��Vc��$#��+>��N+6W������٘ī0E�,0V��>����5�{�#0t2h�N�1yf��t�/	힍U �+���x@�܇M��ƈƓ����DL"��Н7UAj�S��z|Rm��!m���uB_�Ş���w�TMu������7(T��:��[�z���,��p��7v�h���GҟQ��1�l��eT�$G>'92t"��N�_JV���jZ?*i?�;IH~/��j
�/�Bh�Ӝ��!���2�+*XOn�b���^�4����##�N�1��X]��T�xԖ`�,���І�5*lq���/u/�xPԯ`��ީ�K�)48~�{[%���"��MbӀ�as��i4�m1�#w+>9�NW�;oz>�D�SeK`���H"˻_K���E&\ﳭr՛G!D��0V�A��(��)��7̦�2k(�E�錈j���9x�`��Z���1TK�����Iuƀ��8mm}���������$�*ʹ��(�}�8\t�XYj���a�rS�
�5���*h�v#��NŎ>��_M����z$�f���6��I��-6E`���3><Rr��[�#QZ]ڟ!���.9L�t��4�P�u'����2�[I�FJ�p���$#��h���1�j�aS��I��\	�E0�mI�Ɲ���k�G���T�b��*b6f�ɎBc7'J��.Tb��c�3��L$�������i�jei��ЄCQ�$.dq�!���j���Xes~��
���R���P�	�C�ǉ��L�qq�4���n��H'��(�H?3Q������S�B_�SvT�	���8`��QA�# �L�zc����*Z��Q�`3y״���0g��+�u��j��|Ő���i���Cf�8=��s���ӹ"S��є��G�����L�`efl�{we
V�_���Gz>����s�G�'@ogI�Cc��Z�u�)��i�N�5���9��� �����g�#��΁6�������T�x�[%?��L.�6V�����?��k��d�G� B��.7��"�$>7�d�����j#�J+��I�ej�j��q��R$�{x����� rLBm4f7FE;M���w`���B�K�R���Qii��b��4���@��|(�'������2Z����׫Sܽ�����#�Do�ۭ��M͓�N�W�R�*��"%��.�`����O�wb@��DW�@��X��ȹ�uţ���0�,���b��s���*3|ټVmt	M���w�v�×6������|�RwOQ��:�*�k�B.K��|�6��)%�)Xѩ��6F��UDw���(��X#x�o�����N�S
�&{S/w�z��/��ϊ��O׌g�A�s��N�y�c^����Yՙnz��W#~0���^EՅ���:+���0��9K�w���0*#�΅��k���<I�!S<�"������yG�[6�F��qxӇ�gm���#˩#uٷ�L�M�{<�T�m\�CH�����M6�$�	7��Vc^���ݘ����l���E)�� ���*K<X<�Z���9D��"z:�M��P9�Ύ��u	Ga( +�q�
"R-8�]Q��D�#���m~JX�\$���X6�g<��>�g;9����_�j �Ǭ�s���A�c*�`����݉NTK�Eİ޽���|��y�/+=j��ʩ{]�5P��\�%T��BUe��Ҕ���\�E�٠����a;�ƺ(�qkH��ݼ"isj���(v��
d1=�F[m�2�k揖`��$tгM�=	��C�k�,�`U�H�d)��Q��?X��<�m/�4��lx)�?��(��v��*�O����~i��<�s�a�	��o��)��Ku�M�(6��--v�}�0����3���/H�U0h?��w����0|�d9:L3����*��r����9z�V,l$����+Z/!�a�t��1!����}��oQ��� �I��f��m�W�%�ݏ�=�Ar��w��B�Xܸ{o�����GE�zV4�hf\w*��Lc̵7��5d26��j��z躵CxI���C�g�w�3�]h!4�*�,�ɑA���."{��*sDf����V�0�S��vD0���+w�\ZH�$	�W�H� ��:��k�5I	�    .Qs�*�q:ޗ�0W���3]�&!�2�ю�\+�Djyc�����C�3\ׁ��B݊U�4}&M�%txO�8��Q«�i[x|P���B�M��^0X=��H}7��BS�x˒�3�=���:���ϰ��vB`v� ��#��P���/�)g��ޝx/��U��\��TW<�.��qy������C�YR��鱂̧��8���-Ճac�znC��8%g�pL^!7r�V�aY�H���[�无��-��p�ާi���yJ��$g�$�����x�)���⍞�%gu�R�p���`��x����C��^��8�P��f����1�&���R� �^Y��g�yM�	�Q�^�M V�O�^�|A�S���7�t�MP#�)I)�?[��&8�)�9L���֫��ƒ֊&�,T�
/L~�M�a�җO8�nQr�v����Sc�Jڗf�]VJ�:�􉝂u��� F���[� �ͩ&��IAL�x��k�m�q�ܡ�gbS4����r��[i�:EmLJ��)�Ͷd�[Q�FW���PyO�1��֊q�f"��(����;:ǄH�����A�x���զ9���-vgi�� �!E���(VV�m��B�G�xM:�d�{�ه6gϗ��Lb�����@
,h�h�<�r�DH��G�i���*�X�$���Oh�W���Ȧ���s���!\j��|WU���Uq�3W����q�s�uB[�r�V�n�_�`�,VuPֹ�4��AȣP�$ۙ޸�&J4M��s̿&N��8<>9���8�14�]B4P#���9-��y��.��5w�"��ِj�3����e�Z��p�?�NTl�h����g��D.Wb�sԘ���!g���	b��u�9dZ�d�C�-1,rd�f�E�`��r�t�8
�M�N(n��M��Q��s�$A�Z�3�b;Fn����Y���L|��
թ5�=X#��RX��0�CS?Nq%�ᚩz���X��950�eZ�L3���S1,��Jh�Q�q�/�;|w5p%::둹p(��S���m!dA�uޔ#v�@���"S�~�c�$��"��R���AX{�z������Y�N�b�F>��U���đ,af��D4�W�Q�L:�}=���ZbC���h�������2�:h��n/3ol��ưc4��� ���*�bw8�f[6����#,Yٙ�9�8�$���/Q�3ey�5%�H�hiЅ���X�Dt'1R'�@�~yx��ã����U
}d���@������Jsc�2�6P�#�;D��Ȝ�e�H��������'����Ω��)�sփ<	o.���C�hsqƂ'F�Z��%C��-��M���ȭQ�F������0�v�3c�hn��8��Y%ƪ�p׵,�����~1E�p��d�8+�}|d���]�M3u��^���	)�J^P|#�Z��r��� 92��k+�<��zae�$5�0��&>dnXJHvi�>S�a[�}��*�^40U�/�����W:�g�Z�jL�,���_���(���>���1}Ԝ�S�b�ֆ�"E�r'�?��&�F�J%���2|DhK���j5E 6*��m�� �H�0:�r��c�u˗JĖ}���QN�uMao��Z��bHź(���U�$�ߌhiH)��8���!��-�|�?�	�V�!�O�W9�������g[8��h�.�kO~��Scd��c(,W��+ ��aD�hJ��$�u{_X�Vb�*�Ru�N�Nka�n6'G����I�>u�:�\�(cf����q϶�U���T3�Ԗd�b���h��V���L�fT�¸��&��w�L�jWJf�?I�tl9Ul�!ǡ�[ �<0VI�j�
a�n�BOu��z �`��L3�2p�9��#�.�FS6��_����;�Zu�����$��q�U�ƅΞ��~J�J�k��1FЯa��2��ŎA��@�
�Bc���U�QJ�G>	^g@�jR���]oп�2��[ݍ�e[�D��Uy�5J�	���B�
�2��0�q"h݃�r�l�!>_!����TW�2��]W���u}�$E)�19w8�L��+��4|�U-L�,��N�
����
�"+�-��)A�M ��dx�`zD�p'���͌5ς-��S�\V��o�u�q���L=��=��+�)Uà���yc����n�2j��02���?�j5���5�W�R��gI#��]��%��A{a:$$�Q;E�$I���A��Ȟ`���ȳ�;�E_n��M��8������"<��Q�S%n�s��C�c{��k�����Lل��͚7�N��C4�X
r���ҔS旺�/D��(g�F�VĄ��7�)]�h�9��	��	��_f�#�I�LRڢ:Ū̻�{��6Ȥ�� �F�	�jN57���u�񣀠&�.E�$QС0}��j�b18���/��p��'3����+h/Y'ǭ�)o���BL)(���P�$���LJ �@�2_�x�>1�^��|oO��~�167�@��X5W��x�ɸU���j#:D�װ��#���z���W����>�O%U2��Ck j�t�P�`-x���7����fѕ� %ܩх���'�T���L?kc�T��gX�F����a�G[�=}o\Ig�Rj/1}�������
Cׂ�zr9
����qIn�o�C�f/�\��e���"��#�T�|:F�:%x7O��
H���R}b�4���^�).ՃR-3���Z5|���)�ȕ��J��oi������!���i�Q���Q��V���Usm� ��j�g:"���h	�[Z��
��^��5������P}cZ[��5F�h�$���cVl�u�V���5�nZ��]1��-Jb����%��lk[��D��ө�D�7�@��|�p�9�4<*#���)|�����%F�����p0'�7�J�B��I�@�u�k���˫>M0.]en'G�ND�e;�E�����V*/U��P�C�6�^w�CYY����Z��<���o΅ ��=)k�`�&���(9
�(3�7�7�P�[�qO��NW���ׅ��8s:�x����c�\��*^O_N�����=�v]���y�2V�f�H	�R��P-ymL�Z���e~���+�3�{��h_�	��y;��ҥ֔���5q�2���V�_�����jw��q���z]��.���|��g�F��������)�L����+���}�X�������*-�K���q����^h���Y�8=bVBu4_�yŨ���&_�$r���Ϩ+y:�ˍʬ2S���?��P}�����#BQ��QHu�(C�����R������]�|5C��Vy�
Ơ���q���cl�o����.Ih$��3Uy!�5�0l�%��y�c���!�Q3�'=�P��~Wb��W�����Å�}��K_�!��>
�ƨ�O���#�J=��|`��]_�p"	!H�庱���e��}6�q�k߷:V97���`ԍC�JbV�	�#5��R���8�?3F}V`�Z|Ӊ
�gZ�4�gj�=��'x�RE��֫ڤ�R}G���'S��ʌ5��	#��cnZ�"�Yg
%���C���(������-�PhT�b�0�M!���:T�M��Q��<�ʑ�Ʉ9���[����|}N0���>��������֖�GU|���'��r�.�m�?ev�7<N�>�-��Aq�$ś���Q�K�/\��I	��ld+|��t��I��e���Û,�2����>�����%^���-v�r$A/|Zĭ��;뤍I�`�Jѵ*�7�,�*�Y�xf,?�S��0w���?��{�J�A�2M���L�l ��w"��L�x0���K�� V��V�U$l�x-�-����V�+��*�"ѭ���RԤzɘ��
�bd���uUg	�`�[��t �y��"�`�?�y_j�Ȼ�Fw`~����m��Ɯ3����R6X��c�7�sb�7d��>Z��U�F�3��),�_F���R����i| ��[�1~Q]y�m��+X��s���n�4���-;p�b� �  w3�WX��G��u���\�pE	6�6�����{KM̑����Lu�*���f�qWf)�Ԩ �� �¤�X7i�����zA�׀�����4�sB���3u��0�m���G=u����Qw�9Ϸs���t�.��R��_��W�f��V���5�r=��A%{w͆!v�J@Ƨ��sz�w��g����z����c������e�?��åT�hxN[�x�5�G%C_�����P
��M"����M�P�0�H����x����>
ĻG<����P鞓�:���i��S_��]��<��ɋ��S��Cx��=D~������b拣��� F4��N���0}��_1:W�b<_�����'�j�>"�B?O�|�zh�����yc͐wC�q�� ��I7���Ơ�^Z�E��P�W�acx�e����_��Pٍ�A���ǻ1
�iU"o(?���qD���\cOQ���š�� ��c��u�F1"g�1l7tO���Pݬȟ����99;�M=\���%U;�����7+h ��Jf��<c\������q��;���˲���	ɯ"�Ώf�~K�KX�8@���K
]b�� tC5&��;�v��.$z/����O�'��"U5��~
�_��M��(�cр��(M������E�+�7�q�L0
�2ci�7ӭc���3]i��g��DsO�h�{��tr��l�Ο`S�\��u�e��u��^���ͫH�p��ُ.�Y���]$���}h�d'ke�H/�b7���46~p_G�`~Jz��	~�-��oa�����ɡ4��g6Ä��ㅔ�jd�����V��P$�@��c=�V����$�~��e5���u��zn�P�E��;v����`�ts�0}uQ^7�:?����%f���{m��`-umW�L��Kڇ�9�+�g!r���Z`��}4K��R0�gb�"M�`s��s	L�,���:���^�ށ�^n�2���d��5��kuiS5~�T�&�ʔ�!��7~ќ�.0k<���#�����Ǔ,����O�۳��DQo�3x��+3/��G�t�A�j�&
��h23փA����oK����$��N��-й&҉R�NŽ��C� �?_M�v�y*��.��Ϟ)F���Wm!��O�sZ�>�	&����{�P�?<�����9{�7j��R���c`���Iq�Ȍ1s�
�$jK�}����</���_�?�L���c�����2������s�nB
�cE�7{0�㡜�����'q�y��UEt�����|R<��0l*���ػ�e���
�_r�����n��&&E�`al=�8~�ڝj���}�I����c�͏k��~��|�(��a����O"{���������Y�S73�y~S����P�����>�W����뎍�q�O�������%K�7�F�fbhoPn�ž���~�B�
�Zg���J�%�E���ܡ_�{�����q�U�P
O]��%4K�����8�`�楗��H�%�uJ��4�&jVk(d��%��b��1Uw�3��@L���80=�N�Q�`�}�|c��V�o䗽
0����>�n��@����ڤ��5����'�d�E�2|~w�֞z���p�:l������L��(DM��W�Lk�а�y��7���I�w�����X�
�K�QA5p�#���N
���.�e���y6X��\����PSͺ)�~$���������\ҟ��[4�7��'mL��13�ޕ���Z�w��T��}PqF64߹쉿���?�^��[�g��{�
~2F�ں�M) c����_�θJB�"�Gjb��D.�{8����}��`���z_5lk�7���E��Ǉ$�D[~�)=4V+��U�I�K����X鷺�2}"���J��~��}�g��Fў�(�N�\�.k�f��!,���?A01N�Ժ?�O�N։�qu��L镥=��Z���W�����싢��B���	�8��q�QEJ�U�ڿ>����zZ�#��|�¥7�}�b��P����o�n����℃M\�w�=CM�	�"�{q�>�����;�����+�B㡚Tc�S��t����-������KU��,s4;�u�*?Si&�@���?L��0��߹�=�nӔo���߿���Cg�      '      x��}�v9��uͻ�V��tw��I�c�{�|k��9	��F�$���h�$⟠�)����_/�[�hw��{���c���濺����ŗ�����Ϗ�[Z�8an���7�9wI���}�����+k�5Gm)^�g�k�|�|i3x �m��.>0����~�����$�2��`;üN��*�G
H�+����o�?��έ������ѥ2%c��_�?�ڪY��U\��\(/4I�^~�x�Y����܆s�Re�y�����i����cD헋�Tٸ�������9�pqm��~�����˯�gn�[���:��Qi��>?_�D��8�.�m�/{e����_/__�|��6�.�����٦Xp�U��I�J�j6Va��;޷t�����ۏ?����:p�8��Z�H�mKq������p:��!f�Ԙ����;0	�q+� �$�Kf�Jy����ҟ!i�K��>�r�2\پ��}�)��p�a��\)R��?�_�D��s�ih����y׵�!�U���O��R!�������-=�1���\��w� V�Z.;S2�ƒ��n�5�����S$7&���A��!���s}�[��ϧo�lE�B�H�Re�����Ͽ6��#�V��/E(���o����N�����%k+ۗ��o0ܔV4��J��L������O��v��:ʮ��5C�%����B��������p�j$�N�Ke��FE���XY�ۏ&�?6��B���K��.A	�-��Po��u֒cS�r$���`��c�aJǤ0��	[�ڎB�1�	MrWoO��	GUύ��K.YfY���oߞaq�v&�w}�/�Ey�ۗ�//ov��`MG�}{~�������`���N�CݤG�Ѝ�Km��O_QlM~�K��pؚM�+�^�艤��Hǂ�]�q*��τ�p�}��/��Q����G��~��$�L2)#_�*�/!˓t�~qĨ��-�)
OB�I�Z������c�5�Ǳ�SS�2ZU~��I����*���]E뵤�E�~6�/�0�5���:57a�H͐��p]����X��(3�o�޾�}l�,�j�g9ھ-��֒U}�pؒ��ʰ������7X�[�mG�E�	1.������pfq�El�F��$/�a����;�5�RTٚ%������-b�&^�o�.Z�ò����Q���˗W �]s�Yx$2=�������`���=0
�5|�"a-B�͙�;#7��O�w� !\����Q�
j�g��`P9\��������s3���p�������j4 :s�q�������~Q�`�wп�����"U�� 6�wUO͚پ��DN͎d&�a�^+�[���7����2G�G�M�9�������qݙE�������?�^~M7
$UG�ll��Ym7?��~y�*n�DEK|rA�V�N�ZTY�b�ѱ0�4>�����+Lr�H��+e��R��5>���ص5Y�e��������,~�@ֵl&Z��7�W`q��(t�wՉ����dU�yF�������z�[ 0<Bl�c���i���ގ�	:<6�a��{��nm�����4�cv�
.��=.r�G�ȰZ(�>�tq,�}�~���z��5C9���4\�����e�C�J]�����l�E5b0?<pdq͐'�*��,~��/�H��ģ�]w�DVs9�����<\h���Ϸ/H�s\߷�%f>߁���ׁs��25.��^
J+���P�kL����1�y�p�l���P�Ѫ7X���٦L�De|*ǛV!f�0��Bc����O8ʹ��/�%l(�����B�wb��ibf3Q	QݕM��ɒ��O�[2k��>v����l���OQ۷D���TR.B�Eu�.�or��o�_���`i��%��	�>T���Yۍw�4�K���������fh6a�.��%��k��UL��m���.f��@�EvO��E�Ƣq:Vp����X,��%/�| lm�3'�-��ҮnH:�8�g�/�s��	�q�㊗p�O�����N�k�q5]v^^������8�u��z7�.�;������L�	M�����~v-��1ʯ�f�{��c��D��.4I۷�/_�-E��hk�9���L2o?����v�}	��[p�̖i������$�>�9yR�7`jp��Euj󮉎d�v������);�G������L=���k��C��V"m�Y���q��2�:wͫ�`��M�����'��)��Z/�?��<Y�c�cAy;K��`I�Q�
l�WbM5�h�YO�?�q�Ǩ\��I��ח/A�V5�eH6Qs�`iRv�?|�'�?JZq����=���5��	RH@0#���6F��ū8�p���㈦/A#���uN�<�`.Q�H�pk��4�%�wIjaT���	`���|B��$Mt}���]��[��PKQ�"d�,�9�U2�ڄ���O�Z�*N��|	| �������8l�(g�}u�����ʒJjd���@9$j�	t	���ճ5��8�OIth��נR��چs��רڄ˟0��F��F>�5��n�9CBtF�Z�5���p@!Σ�H�E�rT[����T	ժ:��&�S0DK[j<�;�o`}� O�����о��{0���!P
.^>^ɖ-e����Q��珰L&I�@jh
b��`���(�Ih���믷���4g	?A�g��T���8�_ͻe�+�/IR��p��٨���(�v^�!-˂E�{�!��=�<��e��Ѯ�*�fp�
����vn%��ST}�"ή4aF14���q��c��W�򸆉����Ou�C���z˒�;c�����15�H��W�X eM�1k��%����λ8���1a�α΅�U+g�k�@�������C��r�
s ر
j�r�����B̑$q��7Y�8������2X�����c;���ǜ������2�����Y��M/A��
~2��h�JWn�Y;���5���C�����0/cs4�Kh��3�ф-��U��3�+��: r̷��
~�����B��"�G�-�{8���'5O?�A��
�{U�f:H�ŝ�pDH�Q�t�~���y�q{~C�R߯s�s��v�4� ��5�"N��`y��A�đ�?D)����'����aN.bӇ�Mf¨��A�tB��
��� k�%���B&p&>��_�	a%ސl|�J�nc�o��cS�b'�/��Kp ��܁�J�*B�F-�rF5)ѿ�Z��F�U..�8DS�7a�[�Ø�B�#O���#l����h�EͦP��x���~������+���X��҈�
����f]����̑)=Y82i��X[q���u�⸸J��Tm��
k�K7B�W'{2}0�N"�
1i��D�4*5u$j;fE�5��Gq��$\�@��l�>` R�r��]HRu��a���v����!�*��*�f�%!9-߃��a���T��!�~� V
���J^iq�s�b3�J��+yz&"�J5�����UL!���OII���g�8�c&e���#�c�����3/��~P�-9+^a���e\��\��H�3��	PJ&���iY=�u���S�!�Ƃ
�b�u �:d��
	}u �(��ɜ�ydr�5,����� s�ʒլ}�n��:�knBNc���m���FXB6��{�(%���sQ�@H��猌�w�\1#i�EXn��177]w��߆o,�MGa��^��4pg�B�� ��n'R?�*�n����o'�_�iyXP6�`�K�)#Jb������+eS��홃-��J�3	A�W�.Lds�3�%Y������P;�RՑJ�g�xpV��~T�ue�,}��39�0�DBu*��#��H�:T:Dd���rł�&��L�a�T�Ym�d5��-�TNF�����߿�}�I����颠񟚴��D�GW������$��\O#�#�+^��EQ5JiC���P��7h�sr���$R+��!$ "?��s%!1�c�՗Fʏ�>�q��R"�F��NTA~iL    ����"`+��w�-�wS[r�99֋��X'ee~D�(y���
?ʛ����ʰ���|$��>6RI�֙�X0���Vu����j���r�����`b��g)Kh%:w�bn�ص�z�c��D@3~c�}�q��ע��$��i��t{���������Lx��l��3HV�G<�\<L{S8�qIy��:Ɨ�Т�H���������N���̓(��V��]�'�˫\{^1�o%\�NgY��7Ү�Ȍ󙰌0B�Q��>?=��I�`$�*��m�Psf%��r\�ٻl�Ķ!b��L����y�3�H�{ c-@��Ol��=+���0��N�H#4�~^��I�XĘ���-OT�����%O;��������aN�S/�dl�n��c9����(;��Iñ�Y�8/e�@�����w3C$W��*�9A�����@%���v�G��:���'��+�>�>���;8��H�wя
$+�JRjz��J�t4o~w��Yg�6��ϚRq�0sr��y�o_�2�U,�r��������V����5s����b��J������2ܳ�$8��Mw�Q���� �[�O�'�}k���0n�ܢ	+�:�׊9�C�;��s}���1Du��ww�29�׃|BR�ԙ��w�<��3�%H�..��E�1��3��^~ST��8��3�4qͫ�~�;^��,���K�
jTFwW*DD���I�sB>B�/y�z CdWU�'�?�2%�>bxE��#�K~$�x0�@�'�	�kR�1^�����i���B���S�QpvTդ��!J#�|���o��m���'��9��{���� ��7ɭ�掉XHo�܇u��ex���|�3�8��?h�W����W�u6~ӮG'��GhI'EA�4�4\��[0���P�0�T_�EL���_��"����{cX;Y��l���f_'�L����8�V���
��+F��~���{-�󕐶6�;TUd�l!F^�CDF'����vg�A�g<o\�د�3Qr职���%�0i��*o\�7� "����܋�d��p T�ڹ�׉)a옳β^��a8N�p�6�a��/��fZ�&I�:��|~| W�&8� �^��~�� �3�R��ũo��H�Dxi��oT�� _w�2�s@�g��ڃï��_���(�Q����&��ON���yݵ�TLV\����2Ǭ5:���X��gϨܼ�9����b��Y��t��A�^c�v5/T@�8l�;�� �����ʹW	�ht�@�ԏ�$W�b�� %��ь$�&����O��P�p�͓�R��0X�_p���z'-֤�<��n��2�F$���o݄e-���0�r(&}QP�Hmn���}Q�)w"X�}�½`HT_0bp�15���}C�@�߸L!�Se�V�T��QJ᭴�C�A^j��*�">sr�GB�݅i{�,�w��W�K�������Ȉҟ��z���,E��->�Q����i.��W;�ɕaU� �-��-Ō�x'7���3Qk�ҨI�Mj�*�\�#'[w1y�#,��b��/0���rI25f��cV��	�����*���orN,5���돟(���9e�H���eeI�Cn�(+/�ފ2ZV\x�c#�X9�2(����2*���)�z�BA]��,19��N�]�[d�1`�Ձi�4[�G(fd5�R�[�R�.�Z$��/M�X/�~E�ʱ���""�3����ٌv�B�)n�KE����"M�z����t��zA�W�7$�Z�(���y���}���@��*�9*�U6���U�{�#X�:Z;'6�j��>fZ�V��]�d苊���%��K��3�=T�x4��I~\����''Gtp���;'%��ߐ$�8ށP�/��@�T��76����1�Q�\�'�s�x �T�C2��-q8�3u��ٕ���n_����9���y�Ȗ�׭~���9�FzM5w��i�Z�6sMs�Z
��
n�D���G�Bs����+�֎�/�G��.ٹ�w�\�	�ROo����UPu�̑89)��_ER���>e�M�:���26���N��[.�Y��h���A�q�p��f��p�@;)��њ���tX[o4�4�� *�F�	Q;���)�^�8ч�kĊ)=ޙ���.á��ڟ4ő�;ч���*��[����҇���Z�V���)���fϡ��m0ƥ��~�=_N��)��e��gӡA�c�z�Vv'-�������S�\�Y}87�^r��h�ٰh���KC)��W�#Xa;�c)y��jO�
f�m�^�������.aC��M)�-G\�Sn�F��%���;X-��|هk
�Ԕ�A����.0��8�J��+	.MΧ�u�$n�H\|�=����8�1�}��J�1�g�D,� |�l\�M3 [�`(Y��������g3�EJ�n�)���}��߮6M�J��?;Q�n�>㌾�a���~4I�1�Q�tm�P�K���)�K�v2�p����p{�#�S�� ~&�S�r���N�$��8���|�%A{�hMSI`�6�Sv�#�y���t&, ��UK8��|����9:��O2Z�ҋL�d&�P*	���6�S��(����LB�U��?��O�
���.��@����
v.���=���m��*�k�Ά�A��uW9m+nW�������π�nǖ�T`�:ʤa�`��,%*��ʮ�U��9cqpIX-�6�:Ɇlcy ��DS�L���6;��S�Ľ���A|�(��T���	�9c/�l!e���T�&��#��B��y5��=Q�I�w��yޝ-L�G�����wQ�y���8e�׊�^�=��7q��L���$��`�8�Ea=��hPQqE�ez&1*a�X�؜3���W�{!,��k�9�\%DNj|s�r3V�����z@;1���tg(�GNzm<K��v��mI=p'�	�Z.7�3�DB�Ě8�ט�͍f��s�7�{a*�y��hϩܲOY�Wv�z��,Wѹ`$�����J4�M������{���LT�-�f�,(���]���m���#�]�!/<����}�w���n$��]�rWtpɴ���y�*��LΖ?�fshx�]Ir&��.(�֍ci��z}�H<��:~}W�y'Z ���FWKk^*����O���xL���I��n�A�90[9�ȓ����k-�Aa��0ORQ1�fW�T�JF}�%SUW�`(���V�f?n�EC�1��8��%=�ݤ4{m�<e���U�cʞ���u@��������p��wN��~����*a��o6��Q�[�ߝ�E`���!����P�,�����߁i�g�o���篈���;�\�8B��c�G(��t�R�=�WXP����Bũ�
�L�R+8G�ee��;\����*@sA9��۳	F�sr��G� ����L��_�]�7n�2쒐���ALf���^t��e{��6L��f
��մZ����=H��rՆn�O@�!Dw��n��:|I��#C�NCI'�'-�O�����Hz������N�(���X�4�q��J�Q�� 'tr���jP26C�+c|L{���iU!�\���{��M`ڲW9�k�&#�=��v<�j��7q"[��(�k|t��k3H�1���l)%�BB��!w��7r"�}�6��m��E���� �>z���mt{�)`��G�8	�����T��ȍN���,����J-b��:5.�S�'?��$�-�zr���{�?B�5�9�.|q$n�X&y�M
.c����:ج�=Z�q�����l)� 
��`K�U���q5�È��D!�mD�r=��vuR��eQw%G�?���9�Z��l����z�k�� �
�!�sV��D��Gg�Q&��[?G[�*�Tey>LNPq���gy�e�]@��x���[��ٚԩD�k�����̅��Q�a$�x��t�Ԡ����݁�a/C�<��h�[�(e�1X~�=��+4܄2�ѧ�����%}L��"���t�I",F|`�:\����,� �  ��U�����:�$ls�m���8�f��H�:u���'ۃ�p��9�+a_�sؘ�gK�w��+�JK	��+=�!&%`��`�P$.�DLfly �(i��\G�
��&H� Y�e�&�G��c�����\�k9��&�#��9b��jo�#jth(�d��X�������`�[<r���.�u�+�p����j����<�-M՟�"��ע���	4��f3/�fO����
��T�,jh�h5]���-��.ʞ�]0�ꥸ6����g����d�$�P��
����d����*����4���L��}_�㱜��HǱ8܎�P����yv��S�U��ō\��y� c4ȣb�iw`�8�Vo���!.��le��ԯ�|5���e�eqF,s�����i镰�Q-�� ����A���������+~��z*݃y��Ē�����`G�Օr�r�!ȓ$��J��/�J۳B��pD�8��r�"�u�B����1�$�(�h4���Z(�MK0Zf~�{�"^�h�������l��h�X�ڏ�N��]T~�19�WB짨w�K��8��CkLIﴘ��c8���U�r�'�������q�W76`o�*��&F��c+����M8-��1�������Wc��5��,>c��=�D���,��Z��waX��hUi�Fr��v�+fa~	X���%�T��[�����u!1���J |��>��׷�С��('��RƤ���6�?AQT�8㯧0��Һ��xU%$�	!�'%�aߒTꖐ����*;��[��
K(��2����-��"�c�ށi�g��l��Q�J*e��R�(a\�'N�D�J4o�_��j���v�y��u���W	Em$]��t��N�/	��I�w�$Rb�h�O�^D����՘���;0�;��h~����sI2v���yv�K�����Xq��D�>︸sX�Fkr�	�8`��\,�w`I��h,̣��I�{!��\�'R/��7&0�t�m��eN�!X�F�Q	��E����gO��y�s{UO'��c�8��{�������#�G>�ʷ$�P��D���gq�we<�9m�#���qP+#�A\�(,�43�e�� '��F}�,�����Kvy�t�.9\�v��n�U�J}��6� �/VrR�d���݊�⹩�L2\��0�`���l*�'�{�8���"� �䪄<1^���Q�+1K��
D������RFǵԯ�4���?�:��[()��g0K�z�
�a��´�j)Ak�;Hu�2:�G0n�(9�����J���G1�Ek?�R2��w�9�NU)�������EE�(��ɉ�z�5`�7?J����o��Z�R6���DHV��#G�&�z�"?��.0@�����KX�v��B/�!ʌ��G8�îO/��tyv!z��ґ$K�X�w�m���ע�Y�8��X4���Z8G�v2�v��s9��X|�Y��uwW��h9s�,I���#9��´~��Gu	�G��GyT��u6���]�]e��Ӥ>.I�9Gj�K4w0�z�^�*(�M��;paQ:���ʳT��㹜���(�;GVٷ��ށ���Ł��/QR�`�zǿ�5���`Q4��mV�ңI�v)��M�B!��Yr�)]�)�����q�st�/�܇q���q��G�*A2�Q�}����-��Տh�s�JY��
������Fe�o`"�\m��z`���TХ�^ �d�XXX�2��rs�8H\�T(�G���Q�
�J��x~0��I�d̙�W�LG���)}
����U�U^)i�ω�oQ\�V�&�RV�6��'�p����A+�Vk�.L��P����{(����Tm��0SD�g���9����kpfԔ^��u����р_�*�1��\���&^�jv��ݮ��&Ү�����`���RT}m�a����E�Y� ����'�k�B�+�,,�D�ؖ|Q&Y���{0/���հ_m���l���H���-�\S�����peVK!xl>w&�-�L2�X6�p��8"��j���5,��*�T�q�7�=���*ih.}�!�ss��9�ۭb2��ƿ��䵔��0�G�n�f�|J㮼��l�Z����;�Y�Z�PSs� �k�C����$h4�η�NF3ʔ}�Q$]��[��#�}�f��Y��iB���?v-&��ǃq!}�d|�bJ�1�l_���X�z��Q��G�U,):¨��֢��v,���~C'����:눲�Ϛ����I�[8��U��W�$p�Z\�jg.Ϊ)����]�R�;���4��'
���Ag�oōZ�p7H��PNY[��Y�ط�lF7�Dn��E��`Nd�h�T����0?9���[�����T��>���t#g����q�ڋ_��N�A��.(���Ź���&||tʚ��b��#��*��+�dw�ވy����JF��EU`�JpHW����hd�>����u*�݄�Q�;�<�w��cu Ų�a0)�;�=�d4f��d�BWj��5~Ps��Cq�Mb�"uV��U�d���Ւ�Z��_���@eI���\jFWjf�X�.�U���K�UE��Cy�-�<��$�TK�rOz4���΁�Zw�y:���nv�����]�5�\�9_����j�!�s����i�[(>uE��:.p��JY)�KZ�Wk�W���^��'���5�*�`�ْ뒕�����'�� �ë�T���N`F�Io��_k=��р�<ǚ�����(X#\���s_�N�fz�߇uq��ʤ�y��8y>ֱ�k8�� ��ޱaZ6XP�lx}�@����٦3->�������l��/|����&��}��"N��	���"W�OG��zC��s��e#=f��R�l���q�&�(!ǽ̩����T6��u�	dN��*S�W�rh��$ym=͔w�d?�j�(�bb����>��&�
׽6T:8a7�))2XƫM�C�8;X���}�|��N�s�O5X�����0f*�f��i��J��m+�{i���n�$�i`҃D[�6��ֻ8���`�P#@�QFy�s�$�G��<��ړeG3�=�����,H��2a�=X���Y�^�B��:w- bf��OV߃i��(�Ճ�u�e�"N�~���3�����@�����N ��4�F�p_ߓJbﱽ�#\	�o��}g�a��3Y�2^fE� �&��>�I˩O�(���_�\Ɨ����j')�Rj�Q���ۖ�ٛ[���b���+���p% |;~
���+�Na���7��g�/R2��WNg0�&Dꨒ^'���r�K�vo�j���"�+q�o���G�-K���762�9�rPv�X�?�tViEC'F�(�02y�aA;�����G����9����trћ�f/���#��#�9�8��_<$�n�gU��c纛0�M`�G��I�|�����bcҳ��_Y8��! ��������3�ۣ�C-�5|�sN��L��,�}�CU�%�����
|b�~���b�.QQ=�N|��˒$�������J��%��������P�p�'Er����>�ܜT�y��F%���!�����%T�{o�j|�#��Ƒ�;)���G�(�ȝ�wt�r�@���s9��zOvө6O�p���u3Hg�W�5�	���>�2�N)��}��̄��ο�}���3{|F����:&=�:�[E���ם�K��5� 9q��ׇ�2kKýo���]��t=.s������.��׿�?��      "   
  x�}V�r�]C_�ݬ� ��G�v:�l�r&U�l �`R�n�fR�Yd��^�*�� $%wwec�ֽ�uιY�$ьn��h���W-���ٌlI4����H��+�T�q�5F��(!�J�B�t}4�@`wE��}s���x�"���k�i�CK���*���J�t��=��MK�x�c��n�~��J��$�8�&�t��ȍ��s����Pȃ�F�2$8?���7r�U4>x>��+Y�?������m6�PW�$}]�dN��v��.Q����[<>���X��lw��ꍠ����k�lF���E�;�M��X[�C�x�[�&Q8�D���Fg7����ڇ��y�tŽՊ�b'*M�8}�m�]��W$��/!�Zm,�]P��d��)y�[��\��q2���Q�ȍP��i{�a��6�MYhM��G���WN�x�(�:ʧ���L��\7�te;����.�N*4f16oN��(n^��ϲn��؛,y��{A�;]�wX	�Vv�%^0���YL������']*q������B+������$���XZ�eNC��L:�2�N1��mǷp�U���Ɯ������&�&qB��R�.��ر�,Ed����W6B��%��AmM]�:����{�����=�ru�mŻ��{f��g�����!k J�ӯƁy/�'��"nw��<a�����ɺ�骒����omp�W.�*M����9y:}i[�X�6܂#�� ���z�4s��ߝ~7 #���v�Q�ɚ�#,$f�i�ܶ�u�;_�Kf�ʫ�������.֙/��%�Ѧ��3ʡϢ�J��1N��L'ILV�-�9`Q0��ԍ�t��x�l� u�Ӿ �s���y�˻bG��]�OG�gd�	ш#Z�i��ڑd�jxY�Ms�zEe�䎯_yI������� §� �% ��cO�9�ř@�,	�!���/�a[A_��ɑBQ��<.RNg�G�	� ��X 䝺=��8ɤ��ދO�'����.�w������-��1@�*~�$E���Z�?x�Y	o n�di�16I��wt��[���n���l,�!����c�m/���PdF�t%��V6��:�b��4#냨��6���0�4'�S�Z��#y�]`�>d2I1�@��C��4��B��lxmN;��Ȃ�3oj-����n8����oY��b����^ү�0�e�\,KQg1� �pg�N��|�L��G����t�3h ��aN������O� }?|����_��7Z� �`�˂q�#֠N���RR��ڋ�%��K7���ud�#����8��9��qL��֣�W�R��A�z]�O��q8u���%�ll먮�l�]���<��đ��#l��V��\::x��Z�p��h�����|���<�r��(��0f1M��d	�YTR\��I�ȼ���DK�_�~�k�VA�4�����ģ"�mI���	�~��l�WS�z�Q�88�	�a2ޢc!�� �,��w��f\�hX��������rr�m�5��u}~Mᾃ�����PW�)�Ӫڸּ�x����\�fʍ��ے7��x�O�a���<�n�U.�Qqq�������N�C�o.�^�r����р� ���Q��b���w����C_<B;�@jyJ\/��߷祎�����;}q�կ��6�X����M=ט�C��/�k�����H6�B��<YI�hW��չ1�ߡ�k}��K`'�
�}:�L�l�x         B   x�3�.HMM�Tp�((J-.�2���,IMQHL�NLO�2�tKMI-J�Q��,(��K����� .~6     