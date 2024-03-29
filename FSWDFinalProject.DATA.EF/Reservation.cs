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
    
    public partial class Reservation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Reservation()
        {
            this.UserRes = new HashSet<UserRe>();
        }
    
        public int ReservationID { get; set; }
        public int LocationID { get; set; }
        public System.DateTime ReservationDate { get; set; }
        public int OwnerAssetID { get; set; }
        public int RoomID { get; set; }
    
        public virtual Location Location { get; set; }
        public virtual OwnerAsset OwnerAsset { get; set; }
        public virtual Room Room { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserRe> UserRes { get; set; }
    }
}
