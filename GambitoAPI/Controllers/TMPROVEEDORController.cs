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
    public class TMPROVEEDORController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/TMPROVEEDOR
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<TMPROVEEDOR> GetTMPROVEEDORs()
        {
            return db.TMPROVEEDORs;
        }

        // GET: api/TMPROVEEDOR/5
        [ResponseType(typeof(TMPROVEEDOR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetTMPROVEEDOR(string id)
        {
            TMPROVEEDOR tMPROVEEDOR = db.TMPROVEEDORs.Find(id);
            if (tMPROVEEDOR == null)
            {
                return NotFound();
            }

            return Ok(tMPROVEEDOR);
        }

        // PUT: api/TMPROVEEDOR/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutTMPROVEEDOR(string id, TMPROVEEDOR tMPROVEEDOR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tMPROVEEDOR.NIF)
            {
                return BadRequest();
            }

            db.Entry(tMPROVEEDOR).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TMPROVEEDORExists(id))
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

        // POST: api/TMPROVEEDOR
        [ResponseType(typeof(TMPROVEEDOR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostTMPROVEEDOR(TMPROVEEDOR tMPROVEEDOR)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TMPROVEEDORs.Add(tMPROVEEDOR);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (TMPROVEEDORExists(tMPROVEEDOR.NIF))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tMPROVEEDOR.NIF }, tMPROVEEDOR);
        }

        // DELETE: api/TMPROVEEDOR/5
        [ResponseType(typeof(TMPROVEEDOR))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteTMPROVEEDOR(string id)
        {
            TMPROVEEDOR tMPROVEEDOR = db.TMPROVEEDORs.Find(id);
            if (tMPROVEEDOR == null)
            {
                return NotFound();
            }

            db.TMPROVEEDORs.Remove(tMPROVEEDOR);
            db.SaveChanges();

            return Ok(tMPROVEEDOR);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TMPROVEEDORExists(string id)
        {
            return db.TMPROVEEDORs.Count(e => e.NIF == id) > 0;
        }
    }
}