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
    public class CMDBController : ApiController
    {
        private ConexionGambito db = new ConexionGambito();

        // GET: api/CMDB
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<CMDB> GetCMDBs()
        {
            return db.CMDBs;
        }

        // GET: api/CMDB/5
        [ResponseType(typeof(CMDB))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetCMDB(string id)
        {
            CMDB cMDB = db.CMDBs.Find(id);
            if (cMDB == null)
            {
                return NotFound();
            }

            return Ok(cMDB);
        }

        // PUT: api/CMDB/5
        [ResponseType(typeof(void))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PutCMDB(string id, CMDB cMDB)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != cMDB.TipoCI)
            {
                return BadRequest();
            }

            db.Entry(cMDB).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CMDBExists(id))
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

        // POST: api/CMDB
        [ResponseType(typeof(CMDB))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult PostCMDB(CMDB cMDB)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.CMDBs.Add(cMDB);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (CMDBExists(cMDB.TipoCI))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = cMDB.TipoCI }, cMDB);
        }

        // DELETE: api/CMDB/5
        [ResponseType(typeof(CMDB))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult DeleteCMDB(string id)
        {
            CMDB cMDB = db.CMDBs.Find(id);
            if (cMDB == null)
            {
                return NotFound();
            }

            db.CMDBs.Remove(cMDB);
            db.SaveChanges();

            return Ok(cMDB);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CMDBExists(string id)
        {
            return db.CMDBs.Count(e => e.TipoCI == id) > 0;
        }
    }
}