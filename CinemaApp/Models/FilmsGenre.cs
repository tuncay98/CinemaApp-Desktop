//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CinemaApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class FilmsGenre
    {
        public int Id { get; set; }
        public Nullable<int> FilmId { get; set; }
        public Nullable<int> GenreId { get; set; }
    
        public virtual Film Film { get; set; }
        public virtual Genre Genre { get; set; }
    }
}