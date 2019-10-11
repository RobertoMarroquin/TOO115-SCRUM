/*==============================================================*/
/* DBMS name:      MySQL 4.0                                    */
/* Created on:     10/10/2019 19:33:24                          */
/*==============================================================*/


drop table if exists CATEGORIA;

drop table if exists DEPARTAMENTO;

drop table if exists ESTABLECIMIENTO;

drop index INGRESA2_FK on INGRESA;

drop index INGRESA_FK on INGRESA;

drop table if exists INGRESA;

drop index LOCALIZADO_EN_FK on MUNICIPIO;

drop index PERTENECE_A_FK on MUNICIPIO;

drop table if exists MUNICIPIO;

drop index CONTIENE_FK on PRECIO_SONDEADO;

drop table if exists PRECIO_SONDEADO;

drop table if exists PRESENTACION;

drop index TIENE_FK on PRODUCTO;

drop table if exists PRODUCTO;

drop table if exists ROL;

drop index _POSEE__FK on SUB_CATEGORIA;

drop table if exists SUB_CATEGORIA;

drop index TIENE__2_FK on TIENE__;

drop index TIENE___FK on TIENE__;

drop table if exists TIENE__;

drop index UBICADO_EN2_FK on UBICADO_EN;

drop index UBICADO_EN_FK on UBICADO_EN;

drop table if exists UBICADO_EN;

drop table if exists UNIDADMEDIDA;

drop index POSEE_FK on USUARIO;

drop table if exists USUARIO;

drop index _TIENE2_FK on _TIENE;

drop index _TIENE_FK on _TIENE;

drop table if exists _TIENE;

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA
(
   ID_CATEGORIA                   int                            not null,
   NOMBRE_CATEGORIA               char(100),
   primary key (ID_CATEGORIA)
)
type = InnoDB;

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO
(
   CODIGO_DEPARTAMENTO            int                            not null,
   NOMBRE_DEPARTAMENTO            char(20),
   primary key (CODIGO_DEPARTAMENTO)
)
type = InnoDB;

/*==============================================================*/
/* Table: ESTABLECIMIENTO                                       */
/*==============================================================*/
create table ESTABLECIMIENTO
(
   NOMBRE_ESTABLECIMIENTO         char(256),
   TIPO_ESTABLECIMIENTO           int,
   ID_ESTABLECIMIENTO             bigint                         not null,
   primary key (ID_ESTABLECIMIENTO)
)
type = InnoDB;

/*==============================================================*/
/* Table: INGRESA                                               */
/*==============================================================*/
create table INGRESA
(
   USUARIO                        bigint                         not null,
   ID_SONDEO                      bigint                         not null,
   primary key (USUARIO, ID_SONDEO)
)
type = InnoDB;

/*==============================================================*/
/* Index: INGRESA_FK                                            */
/*==============================================================*/
create index INGRESA_FK on INGRESA
(
   USUARIO
);

/*==============================================================*/
/* Index: INGRESA2_FK                                           */
/*==============================================================*/
create index INGRESA2_FK on INGRESA
(
   ID_SONDEO
);

/*==============================================================*/
/* Table: MUNICIPIO                                             */
/*==============================================================*/
create table MUNICIPIO
(
   CODIGO_MUNICIPIO               int                            not null,
   CODIGO_DEPARTAMENTO            int,
   ID_ESTABLECIMIENTO             bigint,
   NOMBRE_MUNICIPIO               char(100),
   primary key (CODIGO_MUNICIPIO)
)
type = InnoDB;

/*==============================================================*/
/* Index: PERTENECE_A_FK                                        */
/*==============================================================*/
create index PERTENECE_A_FK on MUNICIPIO
(
   CODIGO_DEPARTAMENTO
);

/*==============================================================*/
/* Index: LOCALIZADO_EN_FK                                      */
/*==============================================================*/
create index LOCALIZADO_EN_FK on MUNICIPIO
(
   ID_ESTABLECIMIENTO
);

/*==============================================================*/
/* Table: PRECIO_SONDEADO                                       */
/*==============================================================*/
create table PRECIO_SONDEADO
(
   ID_SONDEO                      bigint                         not null,
   ID_PRODUCTO                    bigint,
   PRECIO                         float,
   TIPO_PRECIO                    int,
   primary key (ID_SONDEO)
)
type = InnoDB;

/*==============================================================*/
/* Index: CONTIENE_FK                                           */
/*==============================================================*/
create index CONTIENE_FK on PRECIO_SONDEADO
(
   ID_PRODUCTO
);

/*==============================================================*/
/* Table: PRESENTACION                                          */
/*==============================================================*/
create table PRESENTACION
(
   TIPO_PRESENTACION              char(25),
   ESTADO                         int,
   ID_PRESENTACION                bigint                         not null,
   primary key (ID_PRESENTACION)
)
type = InnoDB;

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   ID_PRODUCTO                    bigint                         not null,
   ID_SUBCATEGORIA                int,
   NOMBRE_PRODUCTO                char(100),
   MARCA                          char(25),
   primary key (ID_PRODUCTO)
)
type = InnoDB;

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create index TIENE_FK on PRODUCTO
(
   ID_SUBCATEGORIA
);

/*==============================================================*/
/* Table: ROL                                                   */
/*==============================================================*/
create table ROL
(
   ROL                            char(15),
   TIPO_USUARIO                   int                            not null,
   primary key (TIPO_USUARIO)
)
type = InnoDB;

/*==============================================================*/
/* Table: SUB_CATEGORIA                                         */
/*==============================================================*/
create table SUB_CATEGORIA
(
   ID_SUBCATEGORIA                int                            not null,
   ID_CATEGORIA                   int,
   NOMBRE_SUBCATEGORIA            char(256),
   primary key (ID_SUBCATEGORIA)
)
type = InnoDB;

/*==============================================================*/
/* Index: _POSEE__FK                                            */
/*==============================================================*/
create index _POSEE__FK on SUB_CATEGORIA
(
   ID_CATEGORIA
);

/*==============================================================*/
/* Table: TIENE__                                               */
/*==============================================================*/
create table TIENE__
(
   ID_PRESENTACION                bigint                         not null,
   ID_PRODUCTO                    bigint                         not null,
   primary key (ID_PRESENTACION, ID_PRODUCTO)
)
type = InnoDB;

/*==============================================================*/
/* Index: TIENE___FK                                            */
/*==============================================================*/
create index TIENE___FK on TIENE__
(
   ID_PRESENTACION
);

/*==============================================================*/
/* Index: TIENE__2_FK                                           */
/*==============================================================*/
create index TIENE__2_FK on TIENE__
(
   ID_PRODUCTO
);

/*==============================================================*/
/* Table: UBICADO_EN                                            */
/*==============================================================*/
create table UBICADO_EN
(
   ID_SONDEO                      bigint                         not null,
   ID_ESTABLECIMIENTO             bigint                         not null,
   primary key (ID_SONDEO, ID_ESTABLECIMIENTO)
)
type = InnoDB;

/*==============================================================*/
/* Index: UBICADO_EN_FK                                         */
/*==============================================================*/
create index UBICADO_EN_FK on UBICADO_EN
(
   ID_SONDEO
);

/*==============================================================*/
/* Index: UBICADO_EN2_FK                                        */
/*==============================================================*/
create index UBICADO_EN2_FK on UBICADO_EN
(
   ID_ESTABLECIMIENTO
);

/*==============================================================*/
/* Table: UNIDADMEDIDA                                          */
/*==============================================================*/
create table UNIDADMEDIDA
(
   ID_MEDIDA                      int                            not null,
   NOMBRE_MEDIDA                  char(100),
   CANTIDAD                       int,
   primary key (ID_MEDIDA)
)
type = InnoDB;

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   USUARIO                        bigint                         not null,
   TIPO_USUARIO                   int,
   CLAVE                          char(256),
   NOMBRE                         char(256),
   DUI                            char(10),
   TELEFONO                       int,
   CORREO                         char(256),
   primary key (USUARIO)
)
type = InnoDB;

/*==============================================================*/
/* Index: POSEE_FK                                              */
/*==============================================================*/
create index POSEE_FK on USUARIO
(
   TIPO_USUARIO
);

/*==============================================================*/
/* Table: _TIENE                                                */
/*==============================================================*/
create table _TIENE
(
   ID_MEDIDA                      int                            not null,
   ID_PRODUCTO                    bigint                         not null,
   primary key (ID_MEDIDA, ID_PRODUCTO)
)
type = InnoDB;

/*==============================================================*/
/* Index: _TIENE_FK                                             */
/*==============================================================*/
create index _TIENE_FK on _TIENE
(
   ID_MEDIDA
);

/*==============================================================*/
/* Index: _TIENE2_FK                                            */
/*==============================================================*/
create index _TIENE2_FK on _TIENE
(
   ID_PRODUCTO
);

alter table INGRESA add constraint FK_INGRESA foreign key (USUARIO)
      references USUARIO (USUARIO) on delete restrict on update restrict;

alter table INGRESA add constraint FK_INGRESA2 foreign key (ID_SONDEO)
      references PRECIO_SONDEADO (ID_SONDEO) on delete restrict on update restrict;

alter table MUNICIPIO add constraint FK_LOCALIZADO_EN foreign key (ID_ESTABLECIMIENTO)
      references ESTABLECIMIENTO (ID_ESTABLECIMIENTO) on delete restrict on update restrict;

alter table MUNICIPIO add constraint FK_PERTENECE_A foreign key (CODIGO_DEPARTAMENTO)
      references DEPARTAMENTO (CODIGO_DEPARTAMENTO) on delete restrict on update restrict;

alter table PRECIO_SONDEADO add constraint FK_CONTIENE foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_TIENE foreign key (ID_SUBCATEGORIA)
      references SUB_CATEGORIA (ID_SUBCATEGORIA) on delete restrict on update restrict;

alter table SUB_CATEGORIA add constraint FK__POSEE_ foreign key (ID_CATEGORIA)
      references CATEGORIA (ID_CATEGORIA) on delete restrict on update restrict;

alter table TIENE__ add constraint FK_TIENE__ foreign key (ID_PRESENTACION)
      references PRESENTACION (ID_PRESENTACION) on delete restrict on update restrict;

alter table TIENE__ add constraint FK_TIENE__2 foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

alter table UBICADO_EN add constraint FK_UBICADO_EN foreign key (ID_SONDEO)
      references PRECIO_SONDEADO (ID_SONDEO) on delete restrict on update restrict;

alter table UBICADO_EN add constraint FK_UBICADO_EN2 foreign key (ID_ESTABLECIMIENTO)
      references ESTABLECIMIENTO (ID_ESTABLECIMIENTO) on delete restrict on update restrict;

alter table USUARIO add constraint FK_POSEE foreign key (TIPO_USUARIO)
      references ROL (TIPO_USUARIO) on delete restrict on update restrict;

alter table _TIENE add constraint FK__TIENE foreign key (ID_MEDIDA)
      references UNIDADMEDIDA (ID_MEDIDA) on delete restrict on update restrict;

alter table _TIENE add constraint FK__TIENE2 foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO) on delete restrict on update restrict;

