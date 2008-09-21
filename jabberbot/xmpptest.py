#!/usr/bin/python2.5
# a sample code to join in chat room and log what is happening.

import sys
import os 
import xmpp

# conference group name and password
CONF=('hackathon@conference.coreduo.local','')

# proxy configuration.
PROXY={}

def messagehandler(sess, mess):
    nick=mess.getFrom().getResource()
    text=mess.getBody()
    if text:
        print (u"%s: %s\n"%(mess.getType(), text)).encode('utf-8')
    reply = mess.buildReply(text)
    sess.send(reply)

def presencehandler(sess, mess):
    """Called when a presence is recieved"""
    who = str(mess.getFrom())
    type = mess.getType()
    if type == None: type = 'available'

    if type == 'subscribe':
        sess.send(xmpp.protocol.Presence(to=who, typ='subscribed'))
        sess.send(xmpp.protocol.Presence(to=who, typ='subscribe'))
        
    elif type == 'unsubscribe':
        sess.send(xmpp.protocol.Presence(to=who, typ='unsubscribed'))
        sess.send(xmpp.protocol.Presence(to=who, typ='unsubscribe'))
    
def ConnectJabber(id, password):
    jid = xmpp.protocol.JID(id)
    sys.stdout.write(jid.getDomain())
    cl = xmpp.Client(jid.getDomain(),debug=[])
    cl.connect(proxy=PROXY)
    cl.auth(jid.getNode(), password)
    cl.RegisterHandler('message', messagehandler)
    cl.RegisterHandler('presence', presencehandler)
    cl.sendInitPresence()
    
    # join conference room
    p=xmpp.protocol.Presence(to='%s/%s'%(CONF[0],jid.getNode()))
    p.setTag('x',namespace=xmpp.NS_MUC).setTagData('password',CONF[1])
    p.getTag('x').addChild('history',{'maxchars':'0','maxstanzas':'0'})
    cl.send(p)

    return cl

if __name__ == '__main__':
    if len(sys.argv) != 3:
        sys.stderr.write("%s: username@jabbernetwork password\n"%sys.argv[0])
        exit()
    cl = ConnectJabber(sys.argv[1], sys.argv[2])
    while 1: 
        cl.Process(1)


