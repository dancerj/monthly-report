#!/usr/bin/python2.5
# a sample code to join in chat room and log what is happening.

import sys, os, time
import xmpp

class JabberChatLog:
    def __init__(self, filename):
        self.logfile = open(filename,"a")

    def gettime(self):
        return time. strftime("%Y%m%d %H:%M")

    def log(self, nick, comment):
        time = self.gettime()
        print >>self.logfile,  (u"[%s] %s: %s"
                                %(time, nick, comment)).encode('utf-8')

class JabberConferenceLogger:
    # conference group name and password
    CONF=('hackathon@conference.coreduo.local','')
    # proxy configuration.
    PROXY={}

    def messagehandler(self, sess, mess):
        nick=mess.getFrom().getResource()
        text=mess.getBody()
        type=mess.getType()
        group=mess.getFrom().getStripped()
        if (type=="chat" or type=="groupchat") and text:
            reply = mess.buildReply(text)
            # if message came from groupchat, respond to the group.
            if type == "groupchat" :
                reply.setTo(group)
                reply.setType("groupchat")
            if nick == self.jid.getNode(): # except my own message, to avoid infinite loop
                return 
            self.log.log(nick, text)
            sess.send(reply)

    def presencehandler(self, sess, mess):
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

    def ConnectJabber(self, id, password):
        self.jid = xmpp.protocol.JID(id)
        sys.stdout.write(self.jid.getDomain())
        cl = xmpp.Client(self.jid.getDomain(),debug=[])
        cl.connect(proxy=self.PROXY)
        cl.auth(self.jid.getNode(), password)
        cl.RegisterHandler('message', self.messagehandler)
        cl.RegisterHandler('presence', self.presencehandler)
        cl.sendInitPresence()

        # join conference room
        p=xmpp.protocol.Presence(to='%s/%s'%(self.CONF[0],self.jid.getNode()))
        p.setTag('x',namespace=xmpp.NS_MUC).setTagData('password',self.CONF[1])
        p.getTag('x').addChild('history',{'maxchars':'0','maxstanzas':'0'})
        cl.send(p)
        self.jabberclient = cl
        return cl

    def __init__ (self, logfilename):
        # Call Connect Jabber.
        self.log = JabberChatLog(logfilename)

if __name__ == '__main__':
    if len(sys.argv) != 4:
        sys.stderr.write("%s: username@jabbernetwork password logfilename\n"%sys.argv[0])
        exit()
    a = JabberConferenceLogger(sys.argv[3])
    cl = a.ConnectJabber(sys.argv[1], sys.argv[2])
    while 1: 
        cl.Process(1)
