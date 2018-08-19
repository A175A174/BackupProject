package com.tianmao.util;

import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

import org.springframework.beans.factory.annotation.Autowired;

import com.tianmao.pojo.Gwc;
import com.tianmao.pojo.MavData;

public class Redis {

	@Autowired
	private ShardedJedisPool shardedJedisPool;
	
	private ShardedJedis shardedJedis = null;
	
	public MavData getMavData() {
		try {
			shardedJedis = shardedJedisPool.getResource();
			if(shardedJedis.get("index".getBytes()) != null) {
				return (MavData)Serialize.unserialize(shardedJedis.get("index".getBytes()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			shardedJedis.close();//正常使用完后，将jedis实例返回到池中
		}
		return null;
	}
	
	public void addMavData(MavData mav) {
		try {
			shardedJedis = shardedJedisPool.getResource();
			shardedJedis.setex("index".getBytes(),60*60,Serialize.serialize(mav));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			shardedJedis.close();//正常使用完后，将jedis实例返回到池中
		}
	}
	
	public Gwc getgwc(String userid) {
		try {
			shardedJedis = shardedJedisPool.getResource();
			byte[] bs = shardedJedis.get(userid.getBytes());
			if(bs != null) {
				return (Gwc)Serialize.unserialize(bs);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			shardedJedis.close();//正常使用完后，将jedis实例返回到池中
		}
		return null;
	}
	
	public void addgwc(String userid,Gwc gwc) {
		try {
			shardedJedis = shardedJedisPool.getResource();
			shardedJedis.set(userid.getBytes(),Serialize.serialize(gwc));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			shardedJedis.close();//正常使用完后，将jedis实例返回到池中
		}
	}

	public void addUUID(String uuid, String userid) {
		try {
			shardedJedis = shardedJedisPool.getResource();//从池中获取jedis实例
			shardedJedis.setex(uuid, 60*60*24*7, userid);
			shardedJedis.set(userid+"s", uuid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			shardedJedis.close();//正常使用完后，将jedis实例返回到池中
		}
	}
	
	public void delUUID(String uuid) {
		try {
			shardedJedis = shardedJedisPool.getResource();//从池中获取jedis实例
			shardedJedis.del(uuid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			shardedJedis.close();//正常使用完后，将jedis实例返回到池中
		}
	}
	
	public String getUUID(String uuid) {
		try {
			shardedJedis = shardedJedisPool.getResource();//从池中获取jedis实例
			return shardedJedis.get(uuid);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			shardedJedis.close();//正常使用完后，将jedis实例返回到池中
		}
	}
}