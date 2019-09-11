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
using System.Web.Http.Cors;

namespace GambitoAPI.Controllers
{
    public class VersionesPptoActivasController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/VersionesPptoActivas
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<VersionesPptoActiva> GetVersionesPptoActivas()
        {
            return db.VersionesPptoActivas;
        }

        // GET: api/VersionesPptoActivas/5
        [ResponseType(typeof(VersionesPptoActiva))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetVersionesPptoActiva(int id)
        {
            VersionesPptoActiva versionesPptoActiva = db.VersionesPptoActivas.Find(id);
            if (versionesPptoActiva == null)
            {
                return NotFound();
            }

            return Ok(versionesPptoActiva);
        }

        // PUT: api/VersionesPptoActivas/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutVersionesPptoActiva(int id, VersionesPptoActiva versionesPptoActiva)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != versionesPptoActiva.Id_VEPR)
            {
                return BadRequest();
            }

            db.Entry(versionesPptoActiva).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VersionesPptoActivaExists(id))
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

        // POST: api/VersionesPptoActivas
        [ResponseType(typeof(VersionesPptoActiva))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostVersionesPptoActiva(VersionesPptoActiva versionesPptoActiva)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.VersionesPptoActivas.Add(versionesPptoActiva);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (VersionesPptoActivaExists(versionesPptoActiva.Id_VEPR))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = versionesPptoActiva.Id_VEPR }, versionesPptoActiva);
        }

        // DELETE: api/VersionesPptoActivas/5
        [ResponseType(typeof(VersionesPptoActiva))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteVersionesPptoActiva(int id)
        {
            VersionesPptoActiva versionesPptoActiva = db.VersionesPptoActivas.Find(id);
            if (versionesPptoActiva == null)
            {
                return NotFound();
            }

            db.VersionesPptoActivas.Remove(versionesPptoActiva);
            db.SaveChanges();

            return Ok(versionesPptoActiva);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool VersionesPptoActivaExists(int id)
        {
            return db.VersionesPptoActivas.Count(e => e.Id_VEPR == id) > 0;
        }
    }
}