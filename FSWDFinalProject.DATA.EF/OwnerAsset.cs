//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FSWDFinalProject.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class OwnerAsset
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OwnerAsset()
        {
            this.Reservations = new HashSet<Reservation>();
        }
    
        public int OwnerAssetID { get; set; }
        public string AssetName { get; set; }
        public string OwnerID { get; set; }
        public string AssetPhoto { get; set; }
        public string Description { get; set; }
        public int ReservedStatusID { get; set; }
    
        public virtual ReservedStatu ReservedStatu { get; set; }
        public virtual UserDetail UserDetail { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reservation> Reservations { get; set; }
    }
}
