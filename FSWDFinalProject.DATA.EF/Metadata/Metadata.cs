﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FSWDFinalProject.DATA.EF//.Metadata
{
    #region Location
    public class LocationMetadata
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "Location")]
        public int LocationID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Location Name")]
        [StringLength(50, ErrorMessage = "Must be 50 characters or less.")]
        public string LocationName { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Address")]
        [StringLength(100, ErrorMessage = "Must be 100 characters or less.")]
        public string Address { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "City")]
        [StringLength(50, ErrorMessage = "Must be 50 characters or less.")]
        public string City { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "State")]
        [StringLength(2, ErrorMessage = "Must be 2 characters.")]
        public string State { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Zip Code")]
        [StringLength(5, ErrorMessage = "Must be 5 characters.")]
        public string ZipCode { get; set; }
    }

    [MetadataType(typeof(LocationMetadata))]
    public partial class Location
    {

    }
    #endregion

    #region OwnerAsset
    public class OwnerAssetMetadata
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "Event")]
        public int OwnerAssetID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Event")]
        [StringLength(50, ErrorMessage = "Must be 50 characters or less.")]
        public string AssetName { get; set; }

        [Display(Name = "Owner")]
        public string OwnerID { get; set; }

        [Display(Name = "Photo")]
        public string AssetPhoto { get; set; }

        [Display(Name = "Description")]
        [StringLength(2000, ErrorMessage = "Must be 2000 characters or less.")]
        [UIHint("MultilineText")]
        public string Description { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Status")]
        public int ReservedStatusID { get; set; }
    }

    [MetadataType(typeof(OwnerAssetMetadata))]
    public partial class OwnerAsset

    {

    }
    #endregion

    #region Reservation
    public class ReservationMetadata
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "Reservation")]
        public int ReservationID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Location")]
        public int LocationID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Reservation Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public DateTime ReservationDate { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Owner")]
        public int OwnerAssetID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Room")]
        public int RoomID { get; set; }
    }

    [MetadataType(typeof(ReservationMetadata))]
    public partial class Reservation
    {

    }
    #endregion

    #region ReservedStatu
    public class ReservedStatuMetadata
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "Reserved Status")]
        public int ReservedStatusID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Status")]
        [StringLength(50, ErrorMessage = "Must be 50 characters or less.")]
        public string StatusName { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Description")]
        [StringLength(300, ErrorMessage = "Must be 300 characters or less.")]
        [UIHint("MultilineText")]
        public string Description { get; set; }
    }

    [MetadataType(typeof(ReservedStatuMetadata))]
    public partial class ReservedStatu
    {

    }
    #endregion

    #region Room
    public class RoomMetadata
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "Room")]
        public int RoomID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Room")]
        [StringLength(50, ErrorMessage = "Must be 50 characters or less.")]
        public string RoomName { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Capacity Limit")]
        public int RoomCapacity { get; set; }
    }

    [MetadataType(typeof(RoomMetadata))]
    public partial class Room
    {

    }
    #endregion

    #region UserDetail
    public class UserDetailMetadata
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "User")]
        public string UserID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "First Name")]
        [StringLength(50, ErrorMessage = "Must be 50 characters or less.")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Last Name")]
        [StringLength(50, ErrorMessage = "Must be 50 characters or less.")]
        public string LastName { get; set; }
    }

    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail
    {

    }
    #endregion

    #region UserRe
    public class UserReMetadata
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "User Reserved")]
        public int UserResID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Attendee")]
        public string UserID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Event")]
        public int ReservationID { get; set; }
    }

    [MetadataType(typeof(UserReMetadata))]
    public partial class UserRe
    {

    }
    #endregion
}
