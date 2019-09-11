using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using GambitoAPI.Models;

namespace GambitoAPI.Controllers
{
    public class DetalleFacturasController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/DetalleFacturas
        public IQueryable<DetalleFactura> GetDetalleFacturas()
        {
            return db.DetalleFacturas;
        }

        // GET: api/DetalleFacturas/5
        [ResponseType(typeof(DetalleFactura))]
        public IHttpActionResult GetDetalleFactura(int id)
        {
            DetalleFactura detalleFactura = db.DetalleFacturas.Find(id);
            if (detalleFactura == null)
            {
                return NotFound();
            }

            return Ok(detalleFactura);
        }

        // PUT: api/DetalleFacturas/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutDetalleFactura(int id, DetalleFactura detalleFactura)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != detalleFactura.IdMOFA)
            {
                return BadRequest();
            }

            db.Entry(detalleFactura).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DetalleFacturaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/DetalleFacturas
        [ResponseType(typeof(DetalleFactura))]
        public IHttpActionResult PostDetalleFactura(DetalleFactura detalleFactura)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.DetalleFacturas.Add(detalleFactura);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (DetalleFacturaExists(detalleFactura.IdMOFA))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = detalleFactura.IdMOFA }, detalleFactura);
        }

        // DELETE: api/DetalleFacturas/5
        [ResponseType(typeof(DetalleFactura))]
        public IHttpActionResult DeleteDetalleFactura(int id)
        {
            DetalleFactura detalleFactura = db.DetalleFacturas.Find(id);
            if (detalleFactura == null)
            {
                return NotFound();
            }

            db.DetalleFacturas.Remove(detalleFactura);
            db.SaveChanges();

            return Ok(detalleFactura);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool DetalleFacturaExists(int id)
        {
            return db.DetalleFacturas.Count(e => e.IdMOFA == id) > 0;
        }
    }
}