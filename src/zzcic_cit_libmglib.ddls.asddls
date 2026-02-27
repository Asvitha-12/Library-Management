@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZZCICIT_LIBMGLIB'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZZCIC_CIT_LIBMGLIB
  provider contract TRANSACTIONAL_QUERY
  as projection on ZZCIR_CIT_LIBMGLIB
  association [1..1] to ZZCIR_CIT_LIBMGLIB as _BaseEntity on $projection.BOOKID = _BaseEntity.BOOKID
{
  key BookID,
  Title,
  Author,
  Category,
  Language,
  Edition,
  NoPages,
  PublishDate,
  Available,
  TotalCopies,
  SelfNum,
  Price,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'Currency', 
      Entity.Name: 'I_CurrencyStdVH', 
      Useforvalidation: true
    } ]
  }
  Currency,
  @Semantics: {
    User.Createdby: true
  }
  LocalCreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  LocalCreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
